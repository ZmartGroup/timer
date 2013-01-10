module Github
  class Issue < Base

    IssueUrl = "https://api.github.com/orgs/zmartgroup/issues?access_token={token}&filter=all&per_page=100"

    attr_accessor :user, :github_id, :number, :title, :body, :state, :repository, :labels, :created_at, :closed_at

    def parse_hash(hash)
      self.github_id  = hash["id"]
      self.number     = hash["number"]
      self.title      = hash["title"]
      self.state      = hash["state"]
      self.created_at = parse_date hash["created_at"]
      self.closed_at  = parse_date hash["closed_at"]
      self.labels     = Github::Label.parse_list(hash["labels"])
      self.user       = Github::User.parse_hash(hash)
      self.repository = Github::Repository.parse_hash(hash["repository"])
    end

    def self.fetch_all(user)
      agent = Curl::Easy.new IssueUrl.gsub(/\{token\}/, user.github_token)
      agent.perform
      parse_list JSON.parse(agent.body_str)
    end

    def time_spent
      @time_spent ||= Work.where(github_issue: work_name).sum(&:hours)
    end

    def work_name
      "#{repository.name}/#{number}"
    end

  end
end