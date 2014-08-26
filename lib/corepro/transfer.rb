require_relative 'models/model_base'
require_relative 'utils/requestor'

module CorePro
  class Transfer < Models::ModelBase

    attr_accessor :customerId
    attr_accessor :fromId
    attr_accessor :toId
    attr_accessor :amount
    attr_accessor :tag
    attr_accessor :transactionId

    def self.create(customerId, fromId, toId, amount, tag, connection = nil, loggingObject = nil)
      t = Transfer.new
      t.customerId = customerId
      t.fromId = fromId
      t.toId = toId
      t.amount = amount
      t.tag = tag
      t.create connection, loggingObject
    end

    def create(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/transfer/create', Transfer, self, connection, loggingObject)
    end

    def self.void(customerId, transactionId, tag, connection = nil, loggingObject = nil)
      t = Transfer.new
      t.customerId = customerId
      t.transactionId = transactionId
      t.tag = tag
      t.void connection, loggingObject
    end

    def void(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/transfer/void', Transfer, self, connection, loggingObject)
    end
  end
end
