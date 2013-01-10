class RenameIssueId < ActiveRecord::Migration
  def change
  	remove_column :works, :issue_id
  	add_column :works, :github_issue, :string
  end
end
