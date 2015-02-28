require 'rails_helper'

RSpec.describe "stores/show", :type => :view do
  before(:each) do
    @store = assign(:store, Store.create!(
      :address => "Address",
      :vendor => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
  end
end
