class TwilioController < ApplicationController

  include Webhookable
  def connect_customer
    # mocking a db of customers, connect to real db in production
    customers = {
      '123' => {'phone_number' => '+13126474655'},
      '456' => {'phone_number' => '+14697899579'}
    }
    # accessing mocked customers db
    customer = customers[params[:id]]
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hello. Connecting you to the customer now.', :voice => 'alice'
      r.Dial :callerId => '(972) 388-3662' do |d|
        d.Number customer['phone_number']
      end
    end

    render_twiml response
  end
end
