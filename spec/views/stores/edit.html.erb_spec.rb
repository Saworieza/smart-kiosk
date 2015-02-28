require 'rails_helper'

RSpec.describe "stores/edit", :type => :view do
  before(:each) do
    @store = assign(:store, Store.create!(
      :address => "MyString",
      :vendor => nil
    ))
  end

  it "renders the edit store form" do
    render

    assert_select "form[action=?][method=?]", store_path(@store), "post" do

      assert_select "input#store_address[name=?]", "store[address]"

      assert_select "input#store_vendor_id[name=?]", "store[vendor_id]"
    end
  end
end
