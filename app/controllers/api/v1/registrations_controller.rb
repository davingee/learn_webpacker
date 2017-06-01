class Api::V1::RegistrationsController < Api::V1::ApplicationController
  
  respond_to :json

  before_action :authenticate_user_from_token!
  before_action :authenticate_user!
  
  def create

    user = User.new(params[:user])
    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
end
