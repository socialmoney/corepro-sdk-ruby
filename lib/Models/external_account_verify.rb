require_relative "Models/model_base"
require_relative "Utils/requestor"
require_relative "Models/external_account_id_only"
require_relative "connection"

module CorePro
  module Models
    class ExternalAccountVerify < ModelBase

      attr_accessor :customerId
      attr_accessor :externalAccountId
      attr_accessor :amount1
      attr_accessor :amount2
    end
  end
end
