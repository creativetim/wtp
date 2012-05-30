Web::Application.routes.draw do
  root :to => 'main#index'
  
  match ':controller(/:action(/:id))(.:format)'
  
  match "/auth/:provider/callback" => "sessions#create", :as => "to_fb"
  match "/signout" => "sessions#destroy", :as => :signout
end
