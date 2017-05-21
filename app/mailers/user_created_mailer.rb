class UserCreatedMailer < ApplicationMailer
  def send_confirmation_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => "Hostfamily <hostfamily" + ENV['mail_at'] + ">",
                      :to      => user.email,
                      :subject => 'Mail',
                      :text    => 'Hey there!!! You are officially part of Hostfamily'}
    mg_client.send_message ENV['domain'], message_params
  end
end
