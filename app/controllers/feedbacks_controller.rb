class FeedbacksController < ApplicationController

  def send_feedback
    info = {
      from: current_user ? current_user.email : params[:from],
      text: params[:text]
    }
    FeedbackMailer.send_feedback(info).deliver
    result = set_success("Your message was sent to parizhskiy@gmail.com")

    render json: result
  end
  
end