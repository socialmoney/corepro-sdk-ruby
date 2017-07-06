require_relative 'models/model_base'
require_relative 'utils/requestor'
require_relative 'models/account_id_only'
require_relative 'models/account_access'

module CorePro
  class Account < Models::ModelBase

    # Identifiers
    attr_accessor :accountId
    attr_accessor :customerId
    attr_accessor :tag
    attr_accessor :name
    attr_accessor :routingNumber
    attr_accessor :routingNumberMasked
    attr_accessor :accountNumber
    attr_accessor :accountNumberMasked
    attr_accessor :legalName1
    attr_accessor :legalName2

    # state related
    attr_accessor :status
    attr_accessor :type
    attr_accessor :createdDate
    attr_accessor :closedDate
    attr_accessor :isPrimary
    attr_accessor :isCloseable
    attr_accessor :lastModifiedDate

    # goal related
    attr_accessor :targetAmount
    attr_accessor :targetDate
    attr_accessor :targetMetDate
    attr_accessor :targetMetPercent
    attr_accessor :category
    attr_accessor :subCategory

    # balance related
    attr_accessor :availableBalance
    attr_accessor :accountBalance
    attr_accessor :pendingBalance
    attr_accessor :balanceLastModifiedDate

    # recurring deposit related
    attr_accessor :recurringContributionType
    attr_accessor :recurringContributionAmount
    attr_accessor :recurringContributionFromExternalAccountId
    attr_accessor :recurringContributionStartDate
    attr_accessor :recurringContributionEndDate
    attr_accessor :recurringContributionNextDate

    # joint account related
    attr_accessor :totalCustomers
    attr_accessor :isJointAccount
    attr_accessor :primaryCustomerId
    attr_accessor :isPrimaryCustomer
    attr_accessor :accessTypeCode
    attr_accessor :customerPriority

    # customizable
    attr_accessor :customField1
    attr_accessor :customField2
    attr_accessor :customField3
    attr_accessor :customField4
    attr_accessor :customField5

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

    def self.listAccess(customerId, accountId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/account/listaccess/#{customerId}/#{accountId}", CorePro::Models::AccountAccess, connection, loggingObject)
    end

    def editAccess(connection = nil, loggingObject = nil)
      aea = CorePro::Utils::Requestor.post('/account/editaccess', CorePro::Models::AccountIdOnly, self, connection, loggingObject)
      aea.accountId
    end

  end
end