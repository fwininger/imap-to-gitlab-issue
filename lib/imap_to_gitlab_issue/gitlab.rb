require 'gitlab'

module ImapToGitlabIssue
  class Gitlab
    def initialize(params = {})
      config = {}
      config.merge!(YAML.load_file(__dir__ + '/../../config/config.yml')['gitlab'])
      config.merge!(params)

      ::Gitlab.configure do |c|
        c.endpoint       = config['endpoint'] # API endpoint URL, default: ENV['GITLAB_API_ENDPOINT']
        c.private_token  = config['private_token'] # user's private token or OAuth2 access token, default: ENV['GITLAB_API_PRIVATE_TOKEN']
      end
    end

    def project(name)
      project = ::Gitlab.project_search(name).select { |p| p.to_h['forked_from_project'].nil? }.first

      # fetch_issues(project.id).each do |issue|
      #  puts issue.title
      # end
    end

    private

    def fetch_issues(project_id, page = 0, per_page = 20)
      issues = ::Gitlab.issues(project_id, per_page: per_page, page: page)

      if issues.count == per_page
        issues += fetch_issues(project_id, page + 1, per_page)
      end

      issues
    end
  end
end
