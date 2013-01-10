class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :works

  validates_presence_of :name

  default_scope order('name')
end