require_relative 'json_base'
require_relative 'program_interest_rate'
require_relative 'program_limit'
module CorePro
  module Models
    class ProgramPrepaid < JsonBase
      def is_hash?
        true
      end
      attr_accessor :category
      attr_accessor :type
      attr_accessor :balanceLimit
      attr_accessor :interestRates
      attr_accessor :isImmediateLoadFromLinkedAccountEnabled
      attr_accessor :isExternalWithdrawEnabled
      attr_accessor :isInterestEnabled
      attr_accessor :isRecurringContributionEnabled
      attr_accessor :perTransactionDepositLimit
      attr_accessor :perTransactionWithdrawLimit

      def initialize
        super
        @interestRates = []
      end

      def from_json! json, classDefs
        classDefs = classDefs || {}
        classDefs['balanceLimit'] = CorePro::Models::ProgramLimit
        classDefs['interestRates'] = CorePro::Models::ProgramInterestRate
        classDefs['perTransactionDepositLimit'] = CorePro::Models::ProgramLimit
        classDefs['perTransactionWithdrawLimit'] = CorePro::Models::ProgramLimit

        super json, classDefs
      end
    end
  end
end