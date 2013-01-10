class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :email, :password
  has_many :works

  default_scope order('name')


  def gravatar
  	hash =  Digest::MD5.hexdigest(self.email)
  	"http://www.gravatar.com/avatar/#{hash}"
  end
end
