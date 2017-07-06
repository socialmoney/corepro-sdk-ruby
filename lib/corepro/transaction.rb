require_relative 'models/model_base'
require_relative 'utils/requestor'

module CorePro
  class Transaction < Models::ModelBase
    attr_accessor :transactionCount
    attr_accessor :customerId
    attr_accessor :transactionId
    attr_accessor :tag
    attr_accessor :createdDate
    attr_accessor :type
    attr_accessor :typeCode
    attr_accessor :status
    attr_accessor :amount
    attr_accessor :settledDate
    attr_accessor :voidedDate
    attr_accessor :nachaDescription
    attr_accessor :friendlyDescription
    attr_accessor :availableDate
    attr_accessor :returnCode
    attr_accessor :isCredit

    def self.list(customerId, accountId, status = nil, beginDate = nil, endDate = nil, pageNumber = 0, pageSize = 200, connection = nil, loggingObject = nil)
      t = Transaction.new
      t.customerId = customerId
      t.list accountId, status, beginDate, endDate, pageNumber, pageSize, connection, loggingObject
    end

    def list(accountId = nil, status = nil, beginDate = nil, endDate =nil, pageNumber =0, pageSize = 200, connection = nil, loggingObject = nil)
      start = beginDate.kind_of?(Date) ? beginDate.strftime('%Y-%m-%d') : (beginDate.kind_of?(String) ? beginDate[0..9] : nil)
      finish = endDate.kind_of?(Date) ? endDate.strftime('%Y-%m-%d') : (endDate.kind_of?(String) ? endDate[0..9] : nil)

      start ||= ''
      finish ||= ''

      if finish != '' && start == ''
        start = '1900-01-01'
      end

      CorePro::Utils::Requestor.get("/transaction/list/#{self.customerId}/#{accountId}/#{Transaction.escape(status)}/#{start}/#{finish}?pageNumber=#{pageNumber}&pageSize=#{pageSize}", Transaction, connection, loggingObject)
    end

    def self.get(customerId, transactionId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/transaction/get/#{customerId}/#{transactionId}", Transaction, connection, loggingObject)
    end

    def self.getByTag(customerId, tag, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/transaction/getByTag/#{customerId}/#{Transaction.escape(tag)}", Transaction, connection, loggingObject)
    end

  end
end
