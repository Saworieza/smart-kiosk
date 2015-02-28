require 'rails_helper'

RSpec.describe "stores/new", :type => :view do
  before(:each) do
    assign(:store, Store.new(
      :address => "MyString",
      :vendor => nil
    ))
  end

  it "renders new store form" do
    render

    assert_select "form[action=?][method=?]", stores_path, "post" do

      assert_select "input#store_address[name=?]", "store[address]"

      assert_select "input#store_vendor_id[name=?]", "store[vendor_id]"
    end
  end
end
