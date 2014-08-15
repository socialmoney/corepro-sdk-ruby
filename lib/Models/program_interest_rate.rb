require_relative 'json_base'
module CorePro
  module Models
    class ProgramInterestRate < JsonBase
      attr_accessor :tier
      attr_accessor :apy
      attr_accessor :apr
      attr_accessor :minimumAmount
      attr_accessor :maximumAmount

    end
  end
end
