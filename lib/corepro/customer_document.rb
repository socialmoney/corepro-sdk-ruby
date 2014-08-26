require_relative 'models/model_base'
require_relative 'utils/requestor'
require 'base64'

module CorePro
  class CustomerDocument < Models::ModelBase

    attr_accessor :customerId
    attr_accessor :documentType
    attr_accessor :documentName
    attr_accessor :documentContent
    attr_accessor :reasonType

    def self.upload(customerId, documentType, documentName, documentContent, reasonType, connection = nil, loggingObject = nil)
      cd = CustomerDocument.new
      cd.customerId = customerId
      cd.documentType = documentType
      cd.documentName = documentName
      cd.documentContent = documentContent
      cd.reasonType = reasonType
      cd.upload connection, loggingObject
    end

    def upload(connection = nil, loggingObject = nil)
      # NOTE: documentContent is assumed to be raw content bytes.
      #       corepro API expects base64 encoded string. so we convert that here.
      self.documentContent = Base64.encode64(self.documentContent)
      CorePro::Utils::Requestor.post('/customerdocument/upload', nil, self, connection, loggingObject)
    end

  end
end
