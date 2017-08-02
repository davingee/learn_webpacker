require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "Name",
      :account_id => "Account",
      :username => "Username",
      :password => "Password",
      :auth_token => "Auth Token",
      :developer_token => "Developer Token",
      :client_id => "Client",
      :client_secret => "Client Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Account/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Auth Token/)
    expect(rendered).to match(/Developer Token/)
    expect(rendered).to match(/Client/)
    expect(rendered).to match(/Client Secret/)
  end
end
