module Github
  class Repository < Base

    attr_accessor :github_id, :name, :private, :url, :owner, :created_at, :issues

    def parse_hash(hash)  
      self.github_id  = hash["id"]
      self.name       = hash["name"]
      self.private    = hash["private"]
      self.url        = hash["url"]
      self.created_at = parse_date hash["created_at"]
      self.owner      = User.parse_hash hash["owner"]
    end

  end
end