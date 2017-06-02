# class Api::V1::ApplicationController < ActionController::Base
class Api::V1::ApplicationController < ApplicationController  
# class Api::V1::ApplicationController < ActionController::API
  respond_to :json

  protect_from_forgery with: :null_session

  include ApiConcern
end
