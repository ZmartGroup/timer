class AddGithubIssueIdToWork < ActiveRecord::Migration
  def change
  	add_column :works, :project_id, :integer
  	add_column :works, :issue_id, :integer
  end
end
