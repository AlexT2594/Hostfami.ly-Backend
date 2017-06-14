class SmsNotification
  def self.send_sms(cell,status)
    account_sid = ENV['twilio_sid']
    auth_token = ENV['twilio_token']
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(
      :body => 'Hostfamily - Your request has been ' + status,
      :to   => cell,
      :from => '+12408927126 ')
  end
end