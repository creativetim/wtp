require 'omniauth'

class ApplicationController < ActionController::Base
  protect_from_forgery

  use Rack::Session::Cookie
  use OmniAuth::Strategies::Developer
end
