require 'rails_helper'

RSpec.describe "bid_managements/new", type: :view do
  before(:each) do
    assign(:bid_management, BidManagement.new(
      :name => "MyString"
    ))
  end

  it "renders new bid_management form" do
    render

    assert_select "form[action=?][method=?]", bid_managements_path, "post" do

      assert_select "input[name=?]", "bid_management[name]"
    end
  end
end
