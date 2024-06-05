# frozen_string_literal: true

require 'faraday'

def lambda_handler(event:, context:)
  connection = Faraday.new(url: 'https://api.twilio.com') do |builder|
    builder.request :authorization, :basic, ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    builder.params = { From: sender, To: receiver, Body: text }
  end
  JSON.parse(connection.post("/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json").body)['sid']
end