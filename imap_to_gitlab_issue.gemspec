$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'imap_to_gitlab_issue/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'imap_to_gitlab_issue'
  s.version     = ImapToGitlabIssue::VERSION
  s.authors     = ['Florian Wininger']
  s.email       = ['fw.centrale@gmail.com']
  s.summary     = 'Read Imap Email and Convert to Gitlab Issues'
  s.description = 'Read Imap Email and Convert to Gitlab Issues'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'breadcrumbs_on_rails'
  s.add_dependency 'rails', '>= 4.2'

  s.add_development_dependency 'rubocop'
end
