module Github
  class Label < Base
    
    set_uniq_id :name

    attr_accessor :name, :color, :url

    def parse_hash(hash)  
      self.name  = hash["name"]
      self.color = hash["color"]
      self.url   = hash["url"]
    end

  end
end