class Api::V1::MainController < Api::V1::ApplicationController

  def index
    if api_v1_user_signed_in?
      render :json => {"signed_in" => true, "user" => current_user}.to_json()
    else
      render :json => {"signed_in" => false}.to_json()
    end
  end

end
