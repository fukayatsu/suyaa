class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :basic_auth

private

  def basic_auth
    return unless ENV['BASIC_AUTH']
    authenticate_or_request_with_http_basic do |user, pass|
      "#{user}:#{pass}" == ENV['BASIC_AUTH']
    end
  end
end
