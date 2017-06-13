class RequestNotificationMailer < ActionMailer::Base
  def send_accepted_notification(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.set_from_address("hostfamily" + ENV['mail_at'], {"first" => "Hostfamily"})
    mb_obj.add_recipient(:to, 'hostfam31@gmail.com'); # Temporarly all emails will be sent to this address so it's easy to activate a user
    mb_obj.set_subject("Hostfamily - Request accepted!")
    mb_obj.set_html_body("<html><body>Dear #{@user.firstname} #{user.lastname},<br/> With great pleasure we inform you that your request has been accepted!<br/>Yours truly,<br/><b>Hostfamily</b></body></html>")
    mg_client.send_message ENV['domain'], mb_obj
  end

  def send_rejected_notification(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    mb_obj = Mailgun::MessageBuilder.new
    mb_obj.set_from_address("hostfamily" + ENV['mail_at'], {"first" => "Hostfamily"})
    mb_obj.add_recipient(:to, 'hostfam31@gmail.com'); # Temporarly all emails will be sent to this address so it's easy to activate a user
    mb_obj.set_subject("Hostfamily - Request rejected")
    mb_obj.set_html_body("<html><body>Dear #{@user.firstname} #{user.lastname},<br/> Unfortunately your request has been rejected.<br/>Yours truly,<br/><b>Hostfamily</b></body></html>")
    mg_client.send_message ENV['domain'], mb_obj
  end
end