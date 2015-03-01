class AnalyticsController < ApplicationController

  before_action :authenticate_vendor!

  def index
    @total_revenue = Vendor.joins(:stores).select("SUM(stores.revenue) as total_revenue, SUM(stores.cost) as total_cost")
    .group("vendor_id").each do |c|
      @total_cost = c.total_cost
      @total_revenue = c.total_revenue
      @total_profit = @total_revenue - @total_cost
    end
  end
end
