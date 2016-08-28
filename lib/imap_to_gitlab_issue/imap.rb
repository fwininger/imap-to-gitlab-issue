require 'net/imap'
require 'yaml'

module ImapToGitlabIssue
  class Imap
    def initialize(params = {})
      config = { 'port' => 995, 'ssl' => true }

      config.merge!(YAML.load_file(__dir__ + '/../../config/config.yml')['imap'])
      config.merge!(params)

      @imap = Net::IMAP.new('imap.gmail.com', config['port'], config['ssl'], nil, false)
      @imap.login(config['login'], config['password'])
    end

    def messages
      @imap.select('inbox')
      @imap.search(['FROM', 'email@example.com']).each do |message_id|
        envelope = @imap.fetch(message_id, 'ENVELOPE')[0].attr['ENVELOPE']
        puts "#{envelope.from[0].name}: \t#{envelope.subject}"
      end
    end
  end
end
