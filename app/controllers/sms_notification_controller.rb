class SmsNotificationController < ApplicationController
  def send_sms
    account_sid = 'AC219b35dcda4364cc45e34338f16bae9b'
    auth_token = '3c47070fb859d3839361f9059e05b5f2'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(
      :body => 'Hostfamily - Your request has been ' + params[:status],
      :to   => params[:cell],
      :from => '+12408927126 ')

  end
end