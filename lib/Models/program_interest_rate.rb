require_relative 'model_base'
module CorePro
  module Models
    class ProgramInterestRate < ModelBase
      attr_accessor :tier
      attr_accessor :apy
      attr_accessor :apr
      attr_accessor :minimumAmount
      attr_accessor :maximumAmount

    end
  end
end
