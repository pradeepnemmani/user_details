class UsersController < ApplicationController
  def new
  	@name = "Sign Up"
  end
  
  def show 
  	@user= User.find(params[:id])
  	@name = @user.name	
  
  end

end
