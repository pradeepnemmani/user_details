class PagesController < ApplicationController

  def home
  	@name = "Home";
    if signed_in?
    @micropost = Micropost.new 
    @feed_items = current_user.feed.paginate(:page => params[:page])
  	end
  end

  def contact
  	@name = "Contact" 
  	puts "in contact"
  end
  def about
  	@name = "About"
  	puts "in about"
  end
  def help
    @name = "Help"
    puts "in help"
  end
end
