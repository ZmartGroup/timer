class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :email, :password
  has_many :works
end
