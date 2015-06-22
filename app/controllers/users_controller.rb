class UsersController < ApplicationController
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
  			redirect_to @user, :flash => {:success => "Welcome to the sample app! #{@user.name}"}
  	else
  		render 'new'
  	end
  	
  end

end
