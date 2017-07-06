# test
require_relative 'model_base'
module CorePro
  module Models
    class AccountAccess < ModelBase
      attr_accessor :customerId
      attr_accessor :accountId
      attr_accessor :accessTypeCode
      attr_accessor :customerPriority
      attr_accessor :firstName
      attr_accessor :middleName
      attr_accessor :lastName
      attr_accessor :suffix
      attr_accessor :customerTag
      attr_accessor :isPrimaryCustomer
      attr_accessor :accountTag
      attr_accessor :accountName
      attr_accessor :accountNumber
      attr_accessor :accountNumberMasked
      attr_accessor :routingNumber
      attr_accessor :routingNumberMasked
      attr_accessor :primaryCustomerId
    end
  end
end
