module Github
  class User < Base

    attr_accessor :github_id, :type, :login, :gravatar_url, :url

    def parse_hash(hash)  
      self.github_id    = hash["id"]
      self.type         = hash["type"]
      self.login        = hash["login"]
      self.gravatar_url = hash["gravatar_url"]
    end

  end
end