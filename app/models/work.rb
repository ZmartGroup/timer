class Work < ActiveRecord::Base
  attr_accessible :category, :category_id, :hours, :user_id, :day, :desc, :github_issue
	belongs_to :category
	belongs_to :user

	validates_presence_of :hours

	default_scope order('day DESC, user_id')


	def github_issue_url
		parts = github_issue.split("/")
		"https://github.com/ZmartGroup/#{parts[0]}/issues/#{parts[1]}"
	end
end
