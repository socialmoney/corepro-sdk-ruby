require_relative 'models/model_base'
require_relative 'utils/requestor'
require_relative 'models/file_content'

module CorePro
  class Statement < Models::ModelBase
    attr_accessor :statementId
    attr_accessor :customerId
    attr_accessor :type
    attr_accessor :month
    attr_accessor :year

    def self.list(customerId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/statement/list/#{customerId}", Statement, connection, loggingObject)
    end

    def self.get(customerId, statementId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/statement/get/#{customerId}/#{statementId}", Statement, connection, loggingObject)
    end

    def self.download(customerId, statementId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/statement/download/#{customerId}/#{statementId}", CorePro::Models::FileContent, connection, loggingObject)
    end
  end
end
