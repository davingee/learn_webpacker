require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :name => "MyString",
      :account_id => "MyString",
      :username => "MyString",
      :password => "MyString",
      :auth_token => "MyString",
      :developer_token => "MyString",
      :client_id => "MyString",
      :client_secret => "MyString"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[name]"

      assert_select "input[name=?]", "account[account_id]"

      assert_select "input[name=?]", "account[username]"

      assert_select "input[name=?]", "account[password]"

      assert_select "input[name=?]", "account[auth_token]"

      assert_select "input[name=?]", "account[developer_token]"

      assert_select "input[name=?]", "account[client_id]"

      assert_select "input[name=?]", "account[client_secret]"
    end
  end
end
