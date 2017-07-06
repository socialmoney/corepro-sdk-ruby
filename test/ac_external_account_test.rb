require_relative '../test/core_pro_test_base'
require_relative  '../lib/corepro/external_account'

class AcExternalAccountTest < CoreProTestBase
  def test_create
    ea = CorePro::ExternalAccount.new
    ea.customerId = @@exampleCustomerId
    ea.tag = "extact ruby #{@@timestamp}"
    ea.routingNumber = '123456789'
    ea.accountNumber = '987654321'
    ea.firstName = 'Edwin'
    ea.lastName = 'Awesome'
    ea.nickName = "Savings #{@@timestamp}"
    ea.type = 'Savings'
    ea.tag = "ext_acct_#{@@timestamp}"
    @@exampleExternalAccountId = ea.create @@exampleConn, nil
    puts "externalAccountId=#{@@exampleExternalAccountId}"
    assert @@exampleExternalAccountId > 0

  end

  def test_get
    puts "getting #{@@exampleExternalAccountId}..."
    ea = CorePro::ExternalAccount.get(@@exampleCustomerId, @@exampleExternalAccountId, @@exampleConn, nil)
    assert_equal 'COREPRO SANDBOX BANK', ea.name
  end

  def test_list
    externalAccounts = CorePro::ExternalAccount.list(@@exampleCustomerId, @@exampleConn, nil)
    assert_equal 1, externalAccounts.length, "Listed #{externalAccounts.length} external accounts for customerId=#{@@exampleCustomerId}"
  end

  def test_update
    ea = CorePro::ExternalAccount.get(@@exampleCustomerId, @@exampleExternalAccountId, @@exampleConn, nil)
    ea.nickName = "Updated external account #{@@timestamp}"
    externalAccountId = ea.update @@exampleConn, nil
    assert externalAccountId == @@exampleExternalAccountId
  end
end