class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_langs, only: :edit
  before_filter :set_langs, only: :update

  def edit
  end
  
  def update
    if !current_user.update_attributes(params[:user])
      set_error(current_user.errors.full_messages.first)
    else
      set_success
    end

    render json: @result
  end

  def sign_out_user
    sign_out current_user
    flash[:notice] = 'Signed out successfully'
    redirect_to root_path
  end

  private

  def get_langs
    @langs = {}
    %w(learner teacher).each do |lt|
      @langs[lt.to_sym] = current_user.send(lt).languages.map(&:name).join(',')
    end
  end

  def set_langs
    %w(learner teacher).each do |lt|
      current_user.send(lt).languages = Language.where(name: params["#{lt}_langs".to_sym].to_s.split(','))
    end
  end

  def set_success
    @result = {status: 'success'}
  end

  def set_error(text)
    @result = {status: 'error', text: text}
  end

end
