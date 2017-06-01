# class Api::V1::ApplicationController < ActionController::Base
class Api::V1::ApplicationController < ActionController::API
  respond_to :json

  protect_from_forgery with: :exception

  before_action :log_request
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  def log_request
    # REQUEST_LOG.info( {
    #   time:                 Time.now.to_s,
    #   ip:                   request.remote_ip,
    #   path:                 request.path,
    #   site:                 request.host,
    #   user_agent:           request.user_agent,
    #   params:               (request.request_parameters.blank? ? request.query_parameters : request.request_parameters),
    #   device:               sub_group_type,
    #   referer_header:       referer,
    #   current_page_header:  current_page,
    #   landing_url_header:   land_url,
    #   visitor_id_header:    request.env['HTTP_VISITOR_ID'],
    #   session_id_header:    request.env['HTTP_SESSION_ID'],
    #   visitor_id:           visitor_id,
    #   session_id:           session_id,
    #   params:               params
    # } )
  end

  def mobile_or_tablet?
    browser.device.mobile? || browser.device.tablet?
  end

  def mobile?
    browser.device.mobile?
  end

  def tablet?
    browser.device.tablet?
  end

  def u_agent
    request.env['HTTP_USER_AGENT']
  end

  def set_response
    response.headers['session_id'] = session_id
    response.headers['visitor_id'] = visitor_id
  end

  def visitor_id
    @visitor_id   ||= request.env['HTTP_VISITOR_ID'] || SecureRandom.uuid
  end

  def session_id
    @session_id   ||= request.env['HTTP_SESSION_ID'] || SecureRandom.uuid
  end

  private

    def browser
      @browser ||= Browser.new(u_agent, accept_language: "en-us")
    end

    def authenticate_user_from_token!
      credentials = request.headers['Authorization'].try(:gsub, 'Token token=', '')
      auth_token  = credentials.try(:split, '_').try(:last)
      id          = credentials.try(:split, '_').try(:first)
      user        = id && User.find(id)
      if user && Devise.secure_compare(user.authentication_token, auth_token)
        sign_in user, store: false
      end
    end

    def current_page
      @addressable ||= Addressable::URI.parse(request.original_url) rescue nil
    end
  
end
