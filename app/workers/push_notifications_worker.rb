class PushNotificationsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(ids, notification)
    gcm =  GCM.new("AIzaSyCn76FrAN32z8FG5QDzQAfTmyrR7qO_LoY")
    options = { data: { message: notification }, collapse_key: "updated_state" }
    response = gcm.send(ids, options)
    puts response
  end
end
