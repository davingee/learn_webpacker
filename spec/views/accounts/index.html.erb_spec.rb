require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :name => "Name",
        :account_id => "Account",
        :username => "Username",
        :password => "Password",
        :auth_token => "Auth Token",
        :developer_token => "Developer Token",
        :client_id => "Client",
        :client_secret => "Client Secret"
      ),
      Account.create!(
        :name => "Name",
        :account_id => "Account",
        :username => "Username",
        :password => "Password",
        :auth_token => "Auth Token",
        :developer_token => "Developer Token",
        :client_id => "Client",
        :client_secret => "Client Secret"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Account".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
    assert_select "tr>td", :text => "Developer Token".to_s, :count => 2
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "Client Secret".to_s, :count => 2
  end
end
