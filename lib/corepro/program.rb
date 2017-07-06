require_relative 'models/model_base'
require_relative 'utils/requestor'
require_relative 'models/program_account'
require_relative 'models/program_checking'
require_relative 'models/program_e_code'
require_relative 'models/program_external_account'
require_relative 'models/program_interest_rate'
require_relative 'models/program_savings'
require_relative 'models/program_prepaid'
require_relative 'models/program_limit'

module CorePro
  class Program < Models::ModelBase

    attr_accessor :name
    attr_accessor :verificationType
    attr_accessor :timeZone
    attr_accessor :perUserDailyWithdrawLimit
    attr_accessor :perUserMonthlyWithdrawLimit
    attr_accessor :perProgramDailyWithdrawLimit
    attr_accessor :perUserDailyDepositLimit
    attr_accessor :perUserMonthlyDepositLimit
    attr_accessor :perProgramDailyDepositLimit
    attr_accessor :website
    attr_accessor :isInternalToInternalTransferEnabled
    attr_accessor :decimalCount
    attr_accessor :validAccountTypes
    attr_accessor :filledDate
    attr_accessor :externalAccountCountMax
    attr_accessor :accountCountMax
    attr_accessor :checkingProducts
    attr_accessor :eCodeProducts
    attr_accessor :savingsProducts
    attr_accessor :prepaidProducts
    attr_accessor :accounts
    attr_accessor :externalAccounts

    def initialize
      super
      @checkingProducts = {}
      @eCodeProducts = {}
      @savingsProducts = {}
      @prepaidProducts = {}
      @accounts = {}
      @externalAccounts = {}
    end

    def from_json! json, classDefs
      classDefs = classDefs || {}
      classDefs['perUserDailyWithdrawLimit'] = CorePro::Models::ProgramLimit
      classDefs['perUserMonthlyWithdrawLimit'] = CorePro::Models::ProgramLimit
      classDefs['perProgramDailyWithdrawLimit'] = CorePro::Models::ProgramLimit

      classDefs['perUserDailyDepositLimit'] = CorePro::Models::ProgramLimit
      classDefs['perUserMonthlyDepositLimit'] = CorePro::Models::ProgramLimit
      classDefs['perProgramDailyDepositLimit'] = CorePro::Models::ProgramLimit

      classDefs['checkingProducts'] = CorePro::Models::ProgramChecking
      classDefs['eCodeProducts'] = CorePro::Models::ProgramECode
      classDefs['savingsProducts'] = CorePro::Models::ProgramSavings
      classDefs['prepaidProducts'] = CorePro::Models::ProgramPrepaid

      classDefs['accounts'] = CorePro::Models::ProgramAccount
      classDefs['externalAccounts'] = CorePro::Models::ProgramExternalAccount

      super json, classDefs
    end

    def self.get(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/program/get", Program, connection, loggingObject)
    end

  end
end
