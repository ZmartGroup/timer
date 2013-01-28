class ChangeHoursToFloat < ActiveRecord::Migration
  def change
  	change_column :works, :hours, :float
  end
end
