class CategoriesController < InheritedResources::Base
	def create
		create!(:notice => "Awesome man! Category created."){ root_url }
	end
end
