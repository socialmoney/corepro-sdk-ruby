require_relative 'json_base'

module CorePro
  module Models
    class CustomerPhone < JsonBase
      attr_accessor :phoneType
      attr_accessor :number
      attr_accessor :isActive
    end
  end
end
