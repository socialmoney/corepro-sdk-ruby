require 'base64'
require 'yaml'

module CorePro
  class Connection

    @@config = begin
      if File.exists?('config.yml')
        YAML.load(File.open('config.yml'))
      else
        {}
      end
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end

    def self.createFromConfig(apiKey = nil, apiSecret = nil, domainName = nil)
      c = Connection.new
      c.apiKey = apiKey || @@config['CoreProApiKey']
      c.apiSecret = apiSecret || @@config['CoreProApiSecret']
      c.domainName = domainName || @@config['CoreProDomainName']
      c
    end

    def initialize(apiKey = nil, apiSecret = nil, domainName = nil)
      @apiKey = apiKey || @@config['CoreProApiKey']
      @apiSecret = apiSecret || @@config['CoreProApiSecret']
      @domainName = domainName || @@config['CoreProDomainName']
      @headerValue = ''
    end

    def apiKey
      @apiKey
    end

    def apiKey=(value)
      @apiKey = value
      @headerValue = ''
    end

    def apiSecret
      @apiSecret
    end

    def apiSecret=(value)
      @apiSecret = value
      @headerValue = ''
    end

    def headerValue
      if (@headerValue || '' == '')
        utf8Value = "#{@apiKey}:#{@apiSecret}".force_encoding('iso-8859-1').encode('utf-8')
        b64 = Base64.encode64(utf8Value)
        @headerValue = "Basic #{b64}"
      end
      @headerValue
    end

    def domainName
      @domainName
    end

    def domainName=(value)
      if value == nil
        @domainName = nil
      else
        value.gsub! 'https://', ''
        value.gsub! 'http://', ''
        value.gsub! 'www.', ''

        @domainName = value.split('/')[0]
      end
    end

  end
end