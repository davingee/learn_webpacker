require 'rails_helper'

RSpec.describe "bid_managements/show", type: :view do
  before(:each) do
    @bid_management = assign(:bid_management, BidManagement.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
