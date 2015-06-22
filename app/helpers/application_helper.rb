module ApplicationHelper
	#Returns a title on a per-page basis.
	def title
		base_title = "#{@name}"
		puts base_title
		return base_title
	end

def logo
	image_tag("logo.png", :alt => "Sample App", :class => "round")
end 
end
