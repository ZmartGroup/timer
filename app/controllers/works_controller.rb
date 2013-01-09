class WorksController < InheritedResources::Base

	def index
		@work = Work.new
		@users = User.all
		@categories = Category.all
		index!
	end

	def create
		create! do |success, failure|
		  failure.html { redirect_to root_url, :notice => "Could not save..." }
		  success.html { redirect_to root_url, :notice => "Dude! Nice job logging that work."}
		end
	end
end