class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :name, :email, :password, :github_uid
  has_many :works

  default_scope order('name')


  def gravatar
  	hash =  Digest::MD5.hexdigest(self.email)
  	"http://www.gravatar.com/avatar/#{hash}"
  end


  def hours_for_category(category)
  	Work.where(category: category, user: self).sum(&:hours)
  end

  def self.load_from_provider(provider,uid)
    where(github_uid: uid).first
  end

  def self.find_by_provider_and_uid(provider, uid)
    where(github_uid: uid).first
  end

end
