require "test/unit"
require "account"
require "external_account"

class AccountTest < Test::Unit::TestCase
  def test_initialize
    assert_instance_of(CorePro::Account, CorePro::Account.new(1))
  end
end