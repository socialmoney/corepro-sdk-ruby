require_relative 'models/model_base'
require_relative 'utils/requestor'

module CorePro
  class Card < Models::ModelBase
    attr_accessor :cardId
    attr_accessor :customerId
    attr_accessor :cardHolderCustomerId
    attr_accessor :typeCode
    attr_accessor :vendorTypeCode
    attr_accessor :status
    attr_accessor :cardNumberMasked
    attr_accessor :tag
    attr_accessor :firstName
    attr_accessor :middleName
    attr_accessor :lastName
    attr_accessor :nickName
    attr_accessor :expireMonth
    attr_accessor :expireYear
    attr_accessor :primaryAccountId
    attr_accessor :lockTypeCode
    attr_accessor :lockReasonTypeCode
    attr_accessor :createdDate
    attr_accessor :requestedDate
    attr_accessor :verifiedDate
    attr_accessor :reissuedDate
    attr_accessor :deniedDate
    attr_accessor :expiredDate
    attr_accessor :archivedDate
    attr_accessor :lastModifiedDate
    attr_accessor :accounts


    def self.get(customerId, cardId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/card/get/#{customerId}/#{cardId}", Card, connection, loggingObject)
    end

    def self.getByTag(customerId, tag, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/card/getByTag/#{customerId}/#{escape(tag)}", Card, connection, loggingObject)
    end

    def self.list(customerId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/card/list/#{customerId}", Card, connection, loggingObject)
    end


    def initiate(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/initiate', Card, self, connection, loggingObject)
    end

    def verify(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/verify', Card, self, connection, loggingObject)
    end

    def reissue(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/reissue', Card, self, connection, loggingObject)
    end

    def archive(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/archive', nil, self, connection, loggingObject)
    end



    def addAccount(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/addAccount', Card, self, connection, loggingObject)
    end

    def removeAccount(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/removeAccount', Card, self, connection, loggingObject)
    end

    def reprioritizeAccount(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/reprioritizeAccount', Card, self, connection, loggingObject)
    end


    def hotlist(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/hotlist', Card, self, connection, loggingObject)
    end

    def lock(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/lock', Card, self, connection, loggingObject)
    end

    def unlock(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/card/unlock', Card, self, connection, loggingObject)
    end

  end
end