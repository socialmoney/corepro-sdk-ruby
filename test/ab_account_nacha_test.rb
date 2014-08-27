require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/account'

class AbAccountNachaTest #< CoreProTestBase

  def test_create
    a = CorePro::Account.new
    a.customerId = @@nachaCustomerId
    a.tag = "act ruby #{@@timestamp}"
    a.type = 'Client'
    a.category = 'CategoryA'
    a.subCategory = 'CategoryB'
    a.isCloseable = true
    a.name = "Account #{@@timestamp}"
    a.targetAmount = 500
    a.targetDate = '01/01/2030'
    @@nachaAccountId = a.create @@nachaConn, nil

    assert @@nachaAccountId > 0

  end

  def test_list
    accounts = CorePro::Account.list(@@nachaCustomerId, @@nachaConn, nil)
    assert_equal 1, accounts.length, "Listed #{accounts.length} accounts for customerId=#{@@nachaCustomerId}"
  end

  def test_get
    a = CorePro::Account.get(@@nachaCustomerId, @@nachaAccountId, @@nachaConn, nil)
    assert_not_empty a.accountNumber
  end

  def test_update
    a = CorePro::Account.get(@@nachaCustomerId, @@nachaAccountId, @@nachaConn, nil)
    a = CorePro::Account.new
    a.accountId = @@nachaAccountId
    a.customerId = @@nachaCustomerId
    a.name = "Updated account #{@@timestamp}"
    accountId = a.update @@nachaConn, nil
    assert accountId == @@nachaAccountId
  end

  def test_zzz_close

  end
end