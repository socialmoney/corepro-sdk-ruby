require_relative "model_base"

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
