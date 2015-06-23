require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    #it "should have the right title" do
    #	get:new
    #	response.should have_selector('title', :content => "sign ip")
    #end
  end
describe "POST create " do

	describe "failure" do

		before(:each) do
			@attr = { :email => "", :password => ""} 	
		 end
		  it "shoukd render  the new page"  do
		  	post:create, :session => @attr
		  	response.should render_template('new')
		   end

		   it "should have the right title" do
		   		post:create, :session => @attr
		   		response.should have_selector('title', :content => "Sign in")
		   end

		   it "should have an error message" do
		   	post:create, :session => @attr
		   	flash.now[:error].should =~ /invalid/i
		   end

	end

end
end