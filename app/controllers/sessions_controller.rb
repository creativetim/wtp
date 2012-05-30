class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    #render :text => YAML::dump(auth)
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    f_name = auth["info"]["first_name"]
    l_name = auth["info"]["last_name"]
    fb_img = auth["info"]["image"]

    user.hydrate_from_facebook(f_name, l_name, fb_img)

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Signed out!"
  end
end