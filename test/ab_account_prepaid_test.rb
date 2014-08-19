require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/account'

class AbAccountPrepaidTest < CoreProTestBase

  def test_create
    a = CorePro::Account.new
    a.customerId = @@prepaidCustomerId
    a.tag = "act#{@@timestamp}"
    a.type = 'Client'
    a.category = 'CategoryA'
    a.subCategory = 'CategoryB'
    a.isCloseable = true
    a.name = "Account #{@@timestamp}"
    a.targetAmount = 500
    a.targetDate = '01/01/2030'
    @@prepaidAccountId = a.create @@prepaidConn, nil

    assert @@prepaidAccountId > 0

  end

  def test_list
    accounts = CorePro::Account.list(@@prepaidCustomerId, @@prepaidConn, nil)
    assert_equal 1, accounts.length, "Listed #{accounts.length} accounts for customerId=#{@@prepaidCustomerId}"
  end

  def test_get
    a = CorePro::Account.get(@@prepaidCustomerId, @@prepaidAccountId, @@prepaidConn, nil)
    assert_not_empty a.accountNumber
  end

  def test_update
    a = CorePro::Account.get(@@prepaidCustomerId, @@prepaidAccountId, @@prepaidConn, nil)
    a = CorePro::Account.new
    a.accountId = @@prepaidAccountId
    a.customerId = @@prepaidCustomerId
    a.name = "Updated account #{@@timestamp}"
    accountId = a.update @@prepaidConn, nil
    assert accountId == @@prepaidAccountId
  end
end