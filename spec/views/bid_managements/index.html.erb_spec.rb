require 'rails_helper'

RSpec.describe "bid_managements/index", type: :view do
  before(:each) do
    assign(:bid_managements, [
      BidManagement.create!(
        :name => "Name"
      ),
      BidManagement.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of bid_managements" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
