require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/account'

class AbAccountTest < CoreProTestBase

  def test_create
    a = CorePro::Account.new
    a.customerId = @@exampleCustomerId
    a.tag = "act ruby #{@@timestamp}"
    a.type = 'Checking'
    a.category = 'CategoryA'
    a.subCategory = 'CategoryB'
    a.isCloseable = true
    a.name = "Account #{@@timestamp}"
    a.targetAmount = 500
    a.targetDate = '01/01/2030'
    @@exampleAccountId = a.create @@exampleConn, nil
    puts "accountId=#{@@exampleAccountId}"
    assert @@exampleAccountId > 0

  end

  def test_list
    accounts = CorePro::Account.list(@@exampleCustomerId, @@exampleConn, nil)
    assert_equal 1, accounts.length, "Listed #{accounts.length} accounts for customerId=#{@@exampleCustomerId}"
  end

  def test_get
    puts "getting #{@@exampleAccountId}..."
    a = CorePro::Account.get(@@exampleCustomerId, @@exampleAccountId, @@exampleConn, nil)
    assert_equal 'CategoryB', a.subCategory
  end

  def test_update
    a = CorePro::Account.get(@@exampleCustomerId, @@exampleAccountId, @@exampleConn, nil)
    a = CorePro::Account.new
    a.accountId = @@exampleAccountId
    a.customerId = @@exampleCustomerId
    a.name = "Updated account #{@@timestamp}"
    accountId = a.update @@exampleConn, nil
    assert accountId == @@exampleAccountId
  end

end