class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit,:update]

  def new
  	@name = "Sign Up"
  	@user =User.new

  end
  
  def show 
  	@user= User.find(params[:id])
  	@name = @user.name	  
  end

  def create
  	@name = "Sign up"
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  			redirect_to @user, :flash => {:success => "Welcome to the sample app!"}
  	else
  		render 'new'
  	end
  	
  end

def edit
  @name = "Edit user"
  @user= User.find(params[:id])

end

def update 
  @user = User.find(params[:id])
  if  @user.update_attributes(params[:user])
   redirect_to @user, :flash => { :success => "Profile updated"}
  else
    @title = "Edit user"
  render 'edit'
  end
  
end
private 

    def authenticate
      # deny_acces in sessions_helper class
       deny_access unless  signed_in?
        
    end
end

