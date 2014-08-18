require_relative "../CorePro/Models/model_base"
require_relative "../CorePro/Utils/requestor"
require_relative "../CorePro/Models/program_interest_rate"
require_relative "../CorePro/Models/program_limit"

module CorePro
  class Program < Models::ModelBase

    attr_accessor :name
    attr_accessor :verificationType
    attr_accessor :timeZone
    attr_accessor :regDFeeAmount
    attr_accessor :regDMonthlyTransactionWithdrawCountMax
    attr_accessor :perTransactionWithdrawLimit
    attr_accessor :perUserDailyWithdrawLimit
    attr_accessor :perUserMonthlyWithdrawLimit
    attr_accessor :perProgramDailyWithdrawLimit
    attr_accessor :perTransactionDepositLimit
    attr_accessor :perUserDailyDepositLimit
    attr_accessor :perUserMonthlyDepositLimit
    attr_accessor :perProgramDailyDepositLimit
    attr_accessor :website
    attr_accessor :isInternalToInternalTransferEnabled
    attr_accessor :decimalCount
    attr_accessor :isInterestEnabled
    attr_accessor :allowedAccountType
    attr_accessor :isRecurringContributionEnabled
    attr_accessor :interestRates
    attr_accessor :filledDate

    def initialize
      super
      @interestRates = []
    end

    def from_json! json, classDefs
      classDefs = classDefs || {}
      classDefs['interestRates'] = CorePro::Models::ProgramInterestRate
      classDefs['perTransactionWithdrawLimit'] = CorePro::Models::ProgramLimit
      classDefs['perUserDailyWithdrawLimit'] = CorePro::Models::ProgramLimit
      classDefs['perUserMonthlyWithdrawLimit'] = CorePro::Models::ProgramLimit
      classDefs['perProgramDailyWithdrawLimit'] = CorePro::Models::ProgramLimit

      classDefs['perTransactionDepositLimit'] = CorePro::Models::ProgramLimit
      classDefs['perUserDailyDepositLimit'] = CorePro::Models::ProgramLimit
      classDefs['perUserMonthlyDepositLimit'] = CorePro::Models::ProgramLimit
      classDefs['perProgramDailyDepositLimit'] = CorePro::Models::ProgramLimit

      super json, classDefs
    end

    def self.get(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.get("/program/get", Program, connection, loggingObject)
    end

  end
end
