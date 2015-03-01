module ApplicationHelper
  def fetch_stores
    @stores = current_vendor.stores.all.map{|p| [ p.address, p.id]}
    @stores.unshift ["Select Store","0"]
  end

  def current_kiosk
    @current_kiosk ||= Kiosk.find(session[:kiosk_id]) if session[:kiosk_id]
  end

  def kiosk_signed_in?
    !current_kiosk.nil?
  end

end
