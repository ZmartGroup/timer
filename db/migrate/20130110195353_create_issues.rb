class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :github_id
      t.integer :number
      t.string :title
      t.string :body
      t.string :status
      t.timestamps
      t.datetime :closed_at
    end
  end
end
