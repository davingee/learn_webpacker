json.extract! account, :id, :name, :account_id, :username, :password, :auth_token, :developer_token, :client_id, :client_secret, :created_at, :updated_at
json.url account_url(account, format: :json)
