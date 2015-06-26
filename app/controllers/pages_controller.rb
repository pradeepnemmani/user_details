class PagesController < ApplicationController

  def home
  	@name = "Home";
    @micropost = Micropost.new if signed_in?
  	puts "in home"
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
