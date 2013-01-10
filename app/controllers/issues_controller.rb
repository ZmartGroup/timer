class IssuesController < InheritedResources::Base

  def index
    @issues = Github::Issue.fetch_all(current_user)
  end

end
