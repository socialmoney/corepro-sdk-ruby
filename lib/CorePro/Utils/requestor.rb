require_relative '../version'
require_relative 'logger'
require_relative '../Models/envelope'
require_relative '../core_pro_api_exception'

require 'openssl'
require 'base64'
require 'net/https'
require 'uri'
require 'json'

module CorePro
  module Utils
    class Requestor

      SDK_USER_AGENT = "CorePro Ruby SDK v #{CorePro::VERSION}"

      def self.get(relativeUrl, classDef, connection, loggingObject)
        url = "https://#{connection.domainName}/#{relativeUrl}"
        http = Net::HTTP.new(connection.domainName, 443)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        headers = { 'User-Agent' => SDK_USER_AGENT,
                  'Content-Type' => 'application/json; charset=utf-8',
                  'Accept' => 'application/json; charset=utf-8',
                  'Authorization' => connection.headerValue,
                  'Host' => connection.domainName}
        request = Net::HTTP::Get.new(url, headers)

        response = http.request(request)

        #Logger.write("hi mom", loggingObject)
        parseResponse(request, response, classDef, connection, loggingObject)

      end

      def self.post(relativeUrl, classDef, toPost, connection, loggingObject)
        uri = URI.parse("https://#{connection.domainName}/#{relativeUrl}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        headers = { 'User-Agent' => SDK_USER_AGENT,
                    'Content-Type' => 'application/json; charset=utf-8',
                    'Accept' => 'application/json; charset=utf-8',
                    'Authorization' => connection.headerValue,
                    'Host' => connection.domainName}
        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.body = toPost.to_json
        response = http.request(request)

        #Logger.write("hi mom", loggingObject)
        parseResponse(request, response, classDef, connection, loggingObject)

      end

      def self.parseResponse(req, resp, classDef, conn, loggingObject)
        case resp.code
          when '501'
            raise 501
          when '502'
            raise 502
          when '503'
            raise 503
          when '504'
            raise 504
          when '505'
            raise 505
          else
            envelope = CorePro::Models::Envelope.new
            envelope.rawRequestBody = req.body
            envelope.rawResponseBody = resp.body
            parsedJson = JSON.parse(resp.body)
            envelope.from_json! parsedJson, { 'data' => classDef }
            if envelope.errors.length > 0
              raise CorePro::CoreProApiException.new(envelope.errors)
            else
              if classDef == NIL
                # no class definition given, return raw envelope
                envelope
              else
                # class definition given, return just that data
                envelope.data
              end
            end
        end
      end
    end
  end
end
