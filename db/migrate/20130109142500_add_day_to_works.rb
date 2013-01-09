class AddDayToWorks < ActiveRecord::Migration
  def change
  	add_column :works, :day, :date
  end
end
