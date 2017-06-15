class UserAuthMailer < ActionMailer::Base
  def send_confirmation_email(user)
    mg_client = Mailgun::Client.new ENV['api_key']
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.set_from_address("hostfamily" + ENV['mail_at'], {"first" => "Hostfamily"})
    mb_obj.add_recipient(:to, 'hostfam31@gmail.com'); # Temporarly all emails will be sent to this address so it's easy to activate a user
    mb_obj.set_subject("Hostfamily - Confirm your registration!")
    mb_obj.set_html_body("<html><body>Click <a href=\"http://localhost:3100/confirm_email/?tk=#{user.confirm_token}\">here</a> to activate your account.</body></html>")
    mg_client.send_message ENV['domain'], mb_obj
  end
  def send_wait_email(user)
    mg_client = Mailgun::Client.new ENV['api_key']
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.set_from_address("hostfamily" + ENV['mail_at'], {"first" => "Hostfamily"})
    mb_obj.add_recipient(:to, 'hostfam31@gmail.com'); # Temporarly all emails will be sent to this address so it's easy to activate a user
    mb_obj.set_subject("Hostfamily - Registration pending")
    mb_obj.set_html_body("<html><body>Dear user, thank you for requesting to join Hostfamily as a volunteer. You'll soon get an email when your account will be active.</body></html>")
    mg_client.send_message ENV['domain'], mb_obj
  end

  def send_welcome(user)
    mg_client = Mailgun::Client.new ENV['api_key']
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.set_from_address("hostfamily" + ENV['mail_at'], {"first" => "Hostfamily"})
    mb_obj.add_recipient(:to, 'hostfam31@gmail.com'); # Temporarly all emails will be sent to this address so it's easy to activate a user
    mb_obj.set_subject("Hostfamily - Registration accepted")
    mb_obj.set_html_body("<html><body>Thank you for joining us! your request has been accepted! Now you can login with the credentials you gave us</body></html>")
    mg_client.send_message ENV['domain'], mb_obj
  end
end
