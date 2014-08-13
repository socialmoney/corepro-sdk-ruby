require "test/unit"
require_relative "../lib/connection"

class CoreProTestBase < Test::Unit::TestCase

  @@customerId = 485
  @@accountId = 486
  @@conn = Connection.createFromConfig()

end