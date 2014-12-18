require 'base64'
require 'yaml'

module CorePro
  class Connection

    attr_accessor :proxyServerName
    attr_accessor :proxyPort

    @@config = begin
      if File.exists?('config.yml')
        YAML.load(File.open('config.yml'))
      elsif File.exists?('../config.yml')
        YAML.load(File.open('../config.yml'))
      else
        {}
      end
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end


    def self.createFromConfig(apiKey = nil, apiSecret = nil, domainName = nil, proxyServerName = nil, proxyPort = nil)
      c = Connection.new
      c.apiKey = apiKey || @@config['CoreProApiKey']
      c.apiSecret = apiSecret || @@config['CoreProApiSecret']
      c.domainName = domainName || @@config['CoreProDomainName']
      c.proxyServerName = proxyServerName || @@config['CoreProProxyServerName']
      c.proxyPort = proxyPort || @@config['CoreProProxyPort']
      c
    end

    def initialize(apiKey = nil, apiSecret = nil, domainName = nil, proxyServerName = nil, proxyPort = nil)
      @apiKey = apiKey || @@config['CoreProApiKey']
      @apiSecret = apiSecret || @@config['CoreProApiSecret']
      @domainName = domainName || @@config['CoreProDomainName']
      @proxyServerName = proxyServerName || @@config['CoreProProxyServerName']
      @proxyPort = proxyPort || @@config['CoreProProxyPort']
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
        b64 = Base64.strict_encode64(utf8Value)
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