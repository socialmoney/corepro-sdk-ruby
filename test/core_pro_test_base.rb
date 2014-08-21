require "test/unit"
require_relative "../lib/corepro/connection"
require_relative "../lib/corepro/core_pro_api_exception"

class CoreProTestBase < Test::Unit::TestCase

  # common properties between prepaid and nacha
  @@timestamp = Time.now.to_s

  @@documentId = nil


  # prepaid-specific program
  # tests the config.yml lookup. should always return coreproprepaid credentials and server.
  @@prepaidConn = CorePro::Connection.createFromConfig()


  @@prepaidCustomerId = nil

  @@prepaidAccountId = nil

  @@prepaidExternalAccountId = nil

  @@prepaidCustomerBeneficiaryId = nil

  @@prepaidInternalToExternalTransactionId = nil

  @@prepaidExternalToInternalTransactionId = nil


  # nacha-specific program

  @@nachaConn = CorePro::Connection.new 'corepronacha', 'corepronacha', 'sandbox-api.corepro.io'

  @@nachaCustomerId = nil

  @@nachaAccountId = nil

  @@nachaExternalAccountId = nil

  @@nachaExternalToInternalTransactionId = nil
end