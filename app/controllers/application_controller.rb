#require 'omniauth'

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  #use Rack::Session::Cookie
  #use OmniAuth::Strategies::Developer
  
  #private
  
  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  
  protected
    #returns the currently logged in user or nil if there isn't one
    def current_user
    		return unless session[:user_id]
    		@current_user ||= User.find_by_id(session[:user_id])
    end
    
    #make current_user available in templates as a helper
    helper_method :current_user
    
    #filter method to enforce a login requirement
    #apply as a before_filter on any controller you want to protect
    def authenticate
      logged_in? ? true : access_denied
    end
    
    #predicate method to test for a logged in user
    def logged_in?
      current_user.is_a? User
    end
    
    #make logged_in? available in templates as a helper
    helper_method :logged_in?
    
    def access_denied
      redirect_to "/auth/facebook" and return false
    end
end
