class SessionsController < ApplicationController
  def new
  	@name= "Sign in"
  end
  
  def  create
  	@name = "Sign in"
  	user = User.authenticate(params[:session][:email],
  							 params[:session][:password])
  	if user.nil?
  		flash.now[:error] = "Invalid email/password combination."
  		@name = "Sign in"
  		render 'new'
  	else
    	sign_in user
      redirect_to user
  	end			
  end
   
   def destroy
    sign_out
    redirect_to home_path
   end
end
  