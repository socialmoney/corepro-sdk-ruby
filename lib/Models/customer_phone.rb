require_relative 'model_base'

module CorePro
  module Models
    class CustomerPhone < ModelBase
      attr_accessor :phoneType
      attr_accessor :number
      attr_accessor :isActive
    end
  end
end
