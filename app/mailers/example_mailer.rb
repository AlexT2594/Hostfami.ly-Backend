class ExampleMailer < ActionMailer::Base

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.set_from_address("hostfamily" + ENV['mail_at'], {"first" => "Hostfamily"})
    mb_obj.add_recipient(:to, 'hostfam31@gmail.com'); # Temporarly all emails will be sent to this address so it's easy to activate a user
    mb_obj.set_subject("Hostfamily - Confirm your registration!")
    mb_obj.set_html_body("<html><body>Click <a href=\"http://localhost:3100/confirm_email/?tk=#{@user.confirm_token}\">here</a> to activate your account.</body></html>")
    mg_client.send_message ENV['domain'], mb_obj
  end
end
