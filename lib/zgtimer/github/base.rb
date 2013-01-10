# encoding: utf-8

require 'curb'

module Github

  class Base
    
    def initialize(*args, &block)
      block.call(self)
    end

    def parse_date(date_string)
      DateTime.parse(date_string) if date_string.present?
    end

    def self.parse_hash(hash)
      new do |hub|
        hub.parse_hash hash
      end
    end

    def self.parse_list(list)
      return [] unless list.present?
      list.map{ |h| parse_hash(h) }
    end

    def ==(other)
      uniq_id == other.uniq_id
    end

    def eql?(other)
      other.is_a?(self.class) && uniq_id.eql?(other.uniq_id)
    end

    def hash
      uniq_id.hash
    end

    def self.set_uniq_id(val)
      @uniq_id = val
    end

    def self.uniq_id
      @uniq_id || :github_id
    end

    def uniq_id
      self.send self.class.uniq_id  
    end

  end

end
