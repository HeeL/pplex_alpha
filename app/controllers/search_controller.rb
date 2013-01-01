class SearchController < ApplicationController
  
  def index
    @users = find_people
    @who = :learner
    render layout: false
  end

  def get_count
    render text: find_people.count
  end

  private

  def find_people
    User.where(active: true)
  end
  
end
