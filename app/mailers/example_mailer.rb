class ExampleMailer < ActionMailer::Base

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => "Hostfamily <hostfamily" + ENV['mail_at'] + ">",
                      :to      => 'hostfam31@gmail.com',
                      :subject => 'Mail',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end
end
