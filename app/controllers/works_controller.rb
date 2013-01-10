class WorksController < InheritedResources::Base

	def index

		# debugger
		# github = Github.new client_id: ENV["GITHUB_ID"], client_secret: ENV["GITHUB_SECRET"]
		# token = github.get_token( session[:code] )
		# github = Github.new :oauth_token => token
		# @scopes = github.scopes.list


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