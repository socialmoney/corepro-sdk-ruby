require_relative 'models/model_base'
require_relative 'utils/requestor'
require_relative 'models/file_content'

module CorePro
  class BankDocument < Models::ModelBase

    attr_accessor :bankId
    attr_accessor :customerId
    attr_accessor :documentId
    attr_accessor :documentType
    attr_accessor :culture
    attr_accessor :html
    attr_accessor :title
    attr_accessor :downloadUrl
    attr_accessor :effectiveDate
    attr_accessor :expireDate

    def self.list(culture, documentType = nil, connection = nil, loggingObject = nil)
      d = BankDocument.new
      d.culture = culture
      d.documentType = documentType
      d.list connection, loggingObject
    end

    def list(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/bankdocument/list/#{escape(self.culture)}/#{escape(self.documentType)}", BankDocument, connection, loggingObject)
    end

    def self.download(culture, documentId, connection = nil, loggingObject = nil)
      d = BankDocument.new
      d.culture = culture
      d.documentId = documentId
      d.download connection, loggingObject
    end

    def download(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/bankdocument/download/#{escape(self.culture)}/#{self.documentId}", CorePro::Models::FileContent, connection, loggingObject)
    end

  end
end
