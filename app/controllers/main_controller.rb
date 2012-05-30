class MainController < ApplicationController
  before_filter :authenticate, :only => [:protect]
  
  def index
    
  end
  
  def protect
    
  end
end
