require_relative 'Models/model_base'
require_relative 'utils/requestor'
require 'base64'

module CorePro
  class ExternalAccountDocument < Models::ModelBase

    attr_accessor :customerId
    attr_accessor :externalAccountId
    attr_accessor :documentType
    attr_accessor :documentName
    attr_accessor :documentContent
    attr_accessor :reasonType

    def self.upload(customerId, externalAccountId, documentType, documentName, documentContent, reasonType, connection = nil, loggingObject = nil)
      ead = ExternalAccountDocument.new
      ead.customerId = customerId
      ead.externalAccountId = externalAccountId
      ead.documentType = documentType
      ead.documentName = documentName
      ead.documentContent = documentContent
      ead.reasonType = reasonType
      ead.upload connection, loggingObject
    end

    def upload(connection = nil, loggingObject = nil)
      # NOTE: documentContent is assumed to be raw content bytes.
      #       corepro API expects base64 encoded string. so we convert that here.
      self.documentContent = Base64.encode64(self.documentContent)

      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post('/externalaccountdocument/upload', nil, self, connection, loggingObject)
    end

  end
end
