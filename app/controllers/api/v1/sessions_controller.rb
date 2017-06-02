class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, :only => :create
  include ApiConcern
end
