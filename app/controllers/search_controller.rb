class SearchController < ApplicationController

  before_filter :find_people
  
  def index
    @users = @users.offset(params[:offset]).limit(2) unless @users.empty?
    render layout: false
  end

  def get_count
    render text: @users.count
  end

  private

  def find_people
    add_who_condition
    add_price_condition
    exclude_current_user
    add_lang_condition
  end

  def add_who_condition
    if params[:who] == 'learner'
      @who = :learner
      @users = User.where(learn: true).joins(:learner)
    else
      @who = :teacher
      @users = User.where(teach: true).joins(:teacher)
    end
  end

  def add_price_condition
    if params[:price].present?
      no_price_cond = params[:no_price_set] ? 'OR min_price + max_price = 0' : 'AND min_price + max_price > 0'
      @users = @users.where("min_price <= ? #{no_price_cond}", params[:price])
    elsif !params[:no_price_set]
      @users = @users.where("min_price + max_price > 0")
    end
  end

  def exclude_current_user
    @users = @users.where('users.id != ?', current_user.id)
  end

  def add_lang_condition
    if params[:lang].present?
      lang = Language.find_by_name(params[:lang])
      if lang
        @users = @users.joins("LEFT JOIN languages_#{@who}s ll ON #{@who}s.id = ll.#{@who}_id")
        @users = @users.where(:'ll.language_id' => lang.id)
      else
        @users = []
      end
    end
  end

end
