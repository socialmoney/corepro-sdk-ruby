require "test/unit"
require_relative "../lib/corepro/connection"
require_relative "../lib/corepro/core_pro_api_exception"

class CoreProTestBase < Test::Unit::TestCase

  # tests the config.yml lookup. should always return coreproprepaid credentials and server.
  @@prepaidConn = CorePro::Connection.createFromConfig()

  @@nachaConn = CorePro::Connection.new 'corepronacha', 'corepronacha', 'sandbox-api.corepro.io'

  @@timestamp = Time.now.to_s

  @@prepaidCustomerId = nil

  @@prepaidAccountId = nil

  @@prepaidExternalAccountId = nil

end