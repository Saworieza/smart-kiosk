module ApplicationHelper
  def fetch_stores
    @stores = current_vendor.stores.all.map{|p| [ p.address, p.id]}
    @stores.unshift ["Select Store","0"]
  end
end
