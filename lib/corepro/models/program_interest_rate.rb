require_relative 'json_base'
module CorePro
  module Models
    class ProgramInterestRate < JsonBase
      attr_accessor :tier
      attr_accessor :apy
      attr_accessor :apr
      attr_accessor :minimumAmount
      attr_accessor :maximumAmount
      attr_accessor :effectiveDate
      attr_accessor :expireDate
      attr_accessor :rateEffectiveDate
      attr_accessor :rateExpireDate
      attr_accessor :description

    end
  end
end
