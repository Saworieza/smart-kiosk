require 'rails_helper'

RSpec.describe "stores/index", :type => :view do
  before(:each) do
    assign(:stores, [
      Store.create!(
        :address => "Address",
        :vendor => nil
      ),
      Store.create!(
        :address => "Address",
        :vendor => nil
      )
    ])
  end

  it "renders a list of stores" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
