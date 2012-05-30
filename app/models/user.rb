class User < ActiveRecord::Base
  attr_protected :email, :provider, :uid
  attr_accessible :first_name, :last_name, :fb_img

  def self.create_with_omniauth(auth)
    create! do |user|
      user.email = auth["info"]["email"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end
  
  def hydrate_from_facebook(f_name, l_name, img)
    self.first_name = f_name if self.first_name != f_name
    self.last_name = l_name if self.last_name != l_name
    self.fb_img = img if self.fb_img != img
    self.save
  end
end
