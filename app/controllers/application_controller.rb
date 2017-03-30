class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      Account.from_token(token)
    end
  end
end
