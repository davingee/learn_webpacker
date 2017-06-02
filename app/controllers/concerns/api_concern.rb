module ApiConcern

  extend ActiveSupport::Concern

  included do
    before_action :log_request
    before_action :set_response
    before_action :authenticate_user_from_token!
    before_action :authenticate_api_v1_user!
  end

  def current_user
    current_api_v1_user
  end

  # def authenticate_user!
  #   authenticate_api_v1_user!
  # end

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

  def user_agent
    request.env['HTTP_USER_AGENT']
  end

  def visitor_id
    @visitor_id   ||= request.env['HTTP_VISITOR_ID'] || SecureRandom.uuid
  end

  def session_id
    @session_id   ||= request.env['HTTP_SESSION_ID'] || SecureRandom.uuid
  end

  private

    def browser
      @browser ||= Browser.new(user_agent, accept_language: "en-us")
    end

    def authenticate_user_from_token!
      # Token token=1_YEaaks8fscavxvx7p2z6
      credentials = request.headers['Authorization'].try(:gsub, 'Token token=', '')
      auth_token  = credentials.try(:split, '_').try(:last)
      id          = credentials.try(:split, '_').try(:first)
      user        = id && User.find(id)
      if user && Devise.secure_compare(user.authentication_token, auth_token)
        sign_in user, store: false
      else
        sign_out user
      end
    end

    def current_page
      @addressable ||= Addressable::URI.parse(request.original_url) rescue nil
    end

    def referer
      @referer ||= Addressable::URI.parse(request.referer) rescue nil
    end

    def set_response
      response.headers['Session-Id']    = session_id
      response.headers['Visitor-Id']    = visitor_id
      response.headers['X-CSRF-Token']  = form_authenticity_token
      response.headers['Referer']       = referer
      response.headers['Current-Page']  = current_page
    end

end
