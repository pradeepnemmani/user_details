class MicropostsController < ApplicationController
# SEE session_helpers class , then we can find authenticate method
before_filter :authenticate
	
	def create
		@micropost = current_user.microposts.build(params[:micropost])  
		 if @micropost.save
		 		redirect_to  '/home', :flash => { :success => " Micropost created!"}		 	
		 else
		 	render 'pages/home'
		 end
		
	end
	 


	 def destroy
	 end

	 private

end 