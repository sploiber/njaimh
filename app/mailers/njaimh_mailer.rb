class NJAIMHMailer < ActionMailer::Base
  # This can be overridden on a per-email basis
  default from: "dristaino@nj-aimh.org"
  def send_email(txt,subject,recipients,attached_file_name,attached_file_data)
    @msg_txt = txt
    @subject = subject
    @bcc = recipients
    @recipients = "dristaino@nj-aimh.org"
    @attached_file_name = attached_file_name
    # Attach only if we have something
    attachments[@attached_file_name] = attached_file_data if @attached_file_name != nil
    mail(:to => @recipients, :bcc => @bcc, :subject => @subject)
  end
end
