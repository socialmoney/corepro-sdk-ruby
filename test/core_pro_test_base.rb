require "test/unit"
require_relative "../lib/CorePro/connection"

class CoreProTestBase < Test::Unit::TestCase

  @@customerId = 485
  @@accountId = 486
  @@conn = CorePro::Connection.createFromConfig()

end