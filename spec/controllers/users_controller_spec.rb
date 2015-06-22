require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
render_views

  describe "GET 'show'" do
  
        before(:each) do
      @user = Factory(:user)
      end

      it "should be successful " do
        get :show, :id =>@user
        response.should be_success
      end

      it "should find the right user" do
        get :show, :id => @user
        assigns(:user).should == @user
      end

       it "should have the right title " do
        get :show, id => @user
        response.should have_selector('title', :content => @user.name)
       end
      it " should  have a profile image" do
        get :show, :id =>@user
        response.should have_selector('h1>img', :class => "gravatar")
      end
      it "should have the right URL " do
         get :show, :id => @userresponse.should have_selector('td>a' , :contact => user_path(@user),
                                                                        :href => user_path(@user))
      end


  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

   #it "should have the right title " do
   	#get :new
   	#response.should have_selector('title', :content => "Sign up")
   #end 
  end

end
