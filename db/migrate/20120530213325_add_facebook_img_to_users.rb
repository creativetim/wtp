class AddFacebookImgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_img, :string
  end
end
