namespace :populate do
  desc "Fill Database with values"
  task data: :environment do
    require 'populator'
    require 'faker'

    User.populate 50 do |user|
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(password: "password").encrypted_password
      user.sign_in_count = 0
      user.points = 10000..200000
      user.level = 0..3
    end

    Item.populate 50 do |item|
      item.name = Faker::Company.name
      item.number_of_items = 100..2000
      item.price = 10..30000
      item.vendor_id = Vendor.first
    end

    Store.populate 10 do |store|
      store.address = Faker::Address.street_address + Faker::Address.secondary_address
      store.vendor_id = Vendor.first
      store.revenue = 100..20000
      store.cost = 100..1000
    end
  end
end
