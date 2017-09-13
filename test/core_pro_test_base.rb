require "test/unit"
require_relative "../lib/corepro/connection"
require_relative "../lib/corepro/core_pro_api_exception"

class CoreProTestBase < Test::Unit::TestCase

  # common properties for tests
  @@timestamp = Time.now.to_s

  @@documentId = nil

  @@exampleConn = CorePro::Connection.new 'example1', 'example1', 'sandbox-api.corepro.io' #, '127.0.0.1', '8888'

  @@exampleProgramReserveAccountId = nil

  @@exampleCustomerId = nil

  @@exampleAccountId = nil

  @@exampleExternalAccountId = nil

  @@exampleCardId = nil

  @@exampleExternalToInternalTransactionId = nil

  @@exampleExternalToInternalTransactionTag = nil

  @@exampleProgramReserveToInternalTransactionId = nil

end