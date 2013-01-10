class WorksController < InheritedResources::Base

	def index

		# github = Github.new client_id: ENV["GITHUB_ID"], client_secret: ENV["GITHUB_SECRET"]
		# #@github_link = github.authorize_url :redirect_uri => 'http://zgtimer.herokuapp.com', :scope => 'repo'
		# @github_url = "https://github.com/login/oauth/authorize?response_type=code&client_id=1e4c8bebbd4f2d741c6c&redirect_uri=http%3A%2F%2Fzgtimer.herokuapp.com&scope=repo"

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