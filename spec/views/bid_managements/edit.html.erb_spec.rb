require 'rails_helper'

RSpec.describe "bid_managements/edit", type: :view do
  before(:each) do
    @bid_management = assign(:bid_management, BidManagement.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit bid_management form" do
    render

    assert_select "form[action=?][method=?]", bid_management_path(@bid_management), "post" do

      assert_select "input[name=?]", "bid_management[name]"
    end
  end
end
