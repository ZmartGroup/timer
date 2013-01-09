class Work < ActiveRecord::Base
  attr_accessible :category, :category_id, :hours, :user_id, :day, :desc
	belongs_to :category
	belongs_to :user

	validates_presence_of :hours
end
