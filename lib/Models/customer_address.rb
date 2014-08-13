require_relative 'model_base'
module CorePro
  module Models
    class CustomerAddress < ModelBase
      attr_accessor :addressType
      attr_accessor :addressLine1
      attr_accessor :addressLine2
      attr_accessor :addressLine3
      attr_accessor :addressLine4
      attr_accessor :city
      attr_accessor :state
      attr_accessor :postalCode
      attr_accessor :country
      attr_accessor :isActive
    end
  end
end
