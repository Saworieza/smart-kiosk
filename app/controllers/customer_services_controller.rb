class CustomerServicesController < ApplicationController
  def agent
    @customer = OpenStruct.new(
      'id' => '123',
      'first_name' => 'Jane',
      'last_name' => 'Doe',
      'city' => 'Seattle',
      'state' => 'WA'
    )
    capability = Twilio::Util::Capability.new ACe7a9cc3dc8168025e510bbb97f392942, 84572ad6e32b5b7894bd9a2cb9da3657
    capability.allow_client_outgoing APdca1647030733b7c378261b6ae4b646a
    @token = capability.generate()
  end
end
