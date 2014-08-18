require_relative "../CorePro/Models/model_base"
require_relative "../CorePro/Utils/requestor"
module CorePro
  class Document < Models::ModelBase

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

    def self.list(cultureName, documentType = nil, connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.get("/document/list/#{cultureName}/#{documentType}", Document, connection, loggingObject)
    end

  end
end
