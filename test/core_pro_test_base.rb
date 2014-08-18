require "test/unit"
require_relative "../lib/corepro/connection"

class CoreProTestBase < Test::Unit::TestCase

  @@customerId = 485
  @@accountId = 486
  @@conn = CorePro::Connection.createFromConfig()

end