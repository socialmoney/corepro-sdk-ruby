require_relative 'models/model_base'
require_relative 'utils/requestor'

module CorePro
  class AccountClose < Models::ModelBase
    attr_accessor :customerId
    attr_accessor :accountId
    attr_accessor :closeToAccountId
    attr_accessor :transactionId
    attr_accessor :transactionTag
    attr_accessor :closingBalanceAmount
    attr_accessor :interestPaidAmount
    attr_accessor :backupWithholdingAmount
    attr_accessor :totalClosingAmount
    attr_accessor :isClosedToExternalAccount

    def close(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post('/account/close', AccountClose, self, connection, loggingObject)
    end
  end
end
