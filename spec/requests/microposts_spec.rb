require 'rails_helper'

RSpec.describe "Microposts", :type => :request do
  before(:each) do
  	user = Factory(:user)
  	visit signin_path
  	fill_in :email. :with => user.mail
  	fill_in :password, :with => user.password
  	click_button
  end
   describe "create " do
   	describe " failiure" do
   	it" should not make a new micropost "do
   	lambda do
   		visit '/home'
   		 fill_in : micropost_content, :with => ""
   		 click_button
   		 response.should render_template('pages/home')
   		 response.should have_selector('div\#error_explanation')
   	end.should_not change(Micropost,:count)
   	end
   	 describe "success" do
   	 	it " should make a new micropost " do 
			content ="loremen ipsum dolor sit amet"
			 lambda do
			 	visit '/home'
			 	fill_in :micropost_content, :with => content
			 	click_button
			 	response.should have_selector('span>content', :content => content)
			 end.should change(Micropost, :count).by(1)
   	 end
   	end
   end
end
