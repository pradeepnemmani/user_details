class UsersController < ApplicationController
  def new
  	@name = "Sign Up"
  	@user =User.new
  	
  end
  
  def show 
  	@user= User.find(params[:id])
  	@name = @user.name	
  
  end

end
