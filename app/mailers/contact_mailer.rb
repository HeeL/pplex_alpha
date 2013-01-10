class ContactMailer < ActionMailer::Base
  default from: ENV['EMAIL_ADDRESS']
 
  def send_learner_contacts(info)
    @info = info
    mail(to: info[:to].email, subject: "[pplex] Learner sent you his contact details")
  end

  def send_teacher_contacts(info)
    @info = info
    mail(to: info[:to].email, subject: "[pplex] Teacher sent you his contact details")
  end

end