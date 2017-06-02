class Api::V1::MainController < Api::V1::ApplicationController

  def index
    if current_user
      render :json => {"signed_in" => true, "user" => current_user}.to_json()
    else
      render :json => {"signed_in" => false}.to_json()
    end
  end

end
