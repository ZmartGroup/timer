class WorksController < InheritedResources::Base

	def index
		@work = Work.new
		@users = User.all
		@categories = Category.all
		index!
	end

	def create
		create!(:notice => "Dude! Nice job logging that work."){ root_url }
	end
end
