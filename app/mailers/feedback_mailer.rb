class FeedbackMailer < ActionMailer::Base
  default from: "no-reply@pplex"

  def send_feedback(info)
    @info = info
    mail(to: 'parizhskiy@gmail.com', subject: "[pplex] Feedback from a user")
  end

end