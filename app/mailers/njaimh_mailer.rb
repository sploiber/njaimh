class NJAIMHMailer < ActionMailer::Base
  # This can be overridden on a per-email basis
  default from: "dristaino@nj-aimh.org"
  def send_email(txt,subject,recipients)
    @msg_txt = txt
    @subject = subject
    @recipients = recipients
    mail(:to => @recipients, :subject => @subject)
  end
end
