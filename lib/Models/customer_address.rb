require_relative 'json_base'
module CorePro
  module Models
    class CustomerAddress < JsonBase
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
