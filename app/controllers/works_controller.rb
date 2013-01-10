require 'open-uri'
class WorksController < InheritedResources::Base

	def index
		uri = "https://api.github.com/orgs/zmartgroup/issues?access_token=#{current_user.github_token}&filter=all&per_page=100"
		content = open(uri).read
		parsed_json = ActiveSupport::JSON.decode(content)

		@issues = Array.new
		parsed_json.each do |r|
			repository = r['repository']['name']
			number 	= r['number']
			title 	= r['title']
			@issues << {repository: repository, number: number, title: title}
		end

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