class UsersController < ApplicationController
  def new
  	@name = "Sign Up"
  end
  
  def show 
  	@name = "User"
  	@user= User.find(params[:id])
  end

end
