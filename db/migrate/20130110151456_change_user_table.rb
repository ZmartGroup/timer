class ChangeUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :github_token, :string
  	add_column :users, :avatar, :string
  end
end
