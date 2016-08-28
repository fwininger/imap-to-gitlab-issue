require_relative 'imap_to_gitlab_issue/imap'
require_relative 'imap_to_gitlab_issue/gitlab'

module ImapToGitlabIssue
  class << self
    def start
      puts 'Start ImapToGitlabIssue'

      Imap.new.messages
    end
  end
end
