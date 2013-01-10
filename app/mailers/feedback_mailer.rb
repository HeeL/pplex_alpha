class FeedbackMailer < ActionMailer::Base
  default from: 'no-reply@pplex.net'

  def send_feedback(info)
    @info = info
    mail(to: ENV['INFO_EMAIL'], subject: "[pplex] Feedback from a user")
  end

end