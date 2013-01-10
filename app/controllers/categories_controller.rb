class CategoriesController < InheritedResources::Base

	def new
		@category = Category.new
		new!
	end

	def create
		create! do |success, failure|
		  failure.html {
		  	flash.now[:error] = "Could not save.. Name must be there"
		  	render :new
		  }
		  success.html { redirect_to root_url, :notice => "Awesome man! Category created"}
		end
	end
end
