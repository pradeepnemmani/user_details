require 'rails_helper'

RSpec.describe "FriendlyForwardings" do
  
  it " should forward to the requested page after signin" do 

  	user = Factory(:user)
  	 visit sdit_user_path(user)
  	  fill_in :email, :with => user.email
  	  fill_in :password, :with => user.password
  	  click_button
  	  response.should render_template('users/edit')
  end
end
