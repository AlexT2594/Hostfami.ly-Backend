class SmsNotificationController < ApplicationController
  def send_sms
    account_sid = ENV['twilio_sid']
    auth_token = ENV['twilio_token']
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(
      :body => 'Hostfamily - Your request has been ' + params[:status],
      :to   => params[:cell],
      :from => '+12408927126 ')

  end
end