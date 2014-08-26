require_relative 'models/model_base'
require_relative 'utils/requestor'
require_relative 'models/account_id_only'

module CorePro
  class Account < Models::ModelBase

    attr_accessor :customerId
    attr_accessor :accountId
    attr_accessor :name
    attr_accessor :accountNumber
    attr_accessor :accountNumberMasked
    attr_accessor :status
    attr_accessor :type
    attr_accessor :createdDate
    attr_accessor :closedDate
    attr_accessor :availableBalance
    attr_accessor :accountBalance
    attr_accessor :isPrimary
    attr_accessor :isCloseable
    attr_accessor :routingNumber
    attr_accessor :targetAmount
    attr_accessor :targetDate
    attr_accessor :category
    attr_accessor :subCategory
    attr_accessor :tag
    attr_accessor :miscellaneous
    attr_accessor :recurringContributionType
    attr_accessor :recurringContributionAmount
    attr_accessor :recurringContributionFromExternalAccountId
    attr_accessor :recurringContributionStartDate
    attr_accessor :recurringContributionEndDate
    attr_accessor :recurringContributionNextDate

    def initialize()
    end

    def self.list(customerId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/account/list/#{customerId}", Account, connection, loggingObject)
    end

    def self.get(customerId, accountId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/account/get/#{customerId}/#{accountId}", Account, connection, loggingObject)
    end

    def self.getByTag(customerId, tag, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/account/getByTag/#{customerId}/#{escape(tag)}", Account, connection, loggingObject)
    end

    def create(connection = nil, loggingObject = nil)
      aid = CorePro::Utils::Requestor.post('/account/create', CorePro::Models::AccountIdOnly, self, connection, loggingObject)
      aid.accountId
    end

    def update(connection = nil, loggingObject = nil)
      aid = CorePro::Utils::Requestor.post('/account/update', CorePro::Models::AccountIdOnly, self, connection, loggingObject)
      aid.accountId
    end

    def close(closeToAccountId, transactionTag, connection = nil, loggingObject = nil)
      ac = CorePro::AccountClose.new
      ac.closeToAccountId = closeToAccountId
      ac.transactionTag = transactionTag
      ac.close(connection, loggingObject)
    end

  end
end