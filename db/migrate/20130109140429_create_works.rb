class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :category_id
      t.integer :user_id
      t.integer :hours

      t.timestamps
    end
  end
end
