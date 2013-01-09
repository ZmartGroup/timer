class AddDescToWorks < ActiveRecord::Migration
  def change
  	add_column :works, :desc, :text
  end
end
