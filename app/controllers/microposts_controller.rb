class MicropostsController < ApplicationController
# SEE session_helpers class , then we can find authenticate method
before_filter :authenticate
before_filter :authorized_user, :only => :destroy
	
	def create
		@micropost = current_user.microposts.build(params[:micropost])  
		 if @micropost.save
		 		redirect_to  '/home', :flash => { :success => " Micropost created!"}		 	
		 else
		 	@feed_items = current_user.feed.paginate(:page => params[:page])
		 	render 'pages/home'
		 end
		
	end
	 


	 def destroy
	 	@micropost.destroy
	 	redirect_to '/home'
	 end

	 private
	 def authorized_user 
	 	@micropost =Micropost.find(params[:id])
	 	redirect_to 'pages/home' unless current_user?(@micropost.user)
	 end

end 