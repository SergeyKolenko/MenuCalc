class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  after_filter :set_csrf_cookie_for_ng
  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic('Login') do |username, password|
      username == Rails.application.secrets.user.to_s && password == Rails.application.secrets.password.to_s
    end
  end
  protected
  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end
