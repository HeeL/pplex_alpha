class UsersController < ApplicationController

  def edit
  end
  
  def update
    reject_bad_params
    render text: current_user.update_attributes(params)
  end

  private
  
  def reject_bad_params
    params.reject!{|k, v| ![:name, :min_price, :max_price].include?(k.to_sym)}
  end

end
