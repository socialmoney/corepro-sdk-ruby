require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/external_account'

class AcExternalAccountPrepaidTest < CoreProTestBase

  def test_create
    ea = CorePro::ExternalAccount.new
    ea.customerId = @@prepaidCustomerId
    ea.nickName = "Ext acct #{@@timestamp}"
    ea.tag = "tag #{@@timestamp}"
    ea.accountNumber = '00001234'
    ea.firstName = 'Jimmy'
    ea.lastName = 'Jameson'
    ea.type = 'Client'
    externalAccountId = ea.create @@prepaidConn, nil
    @@prepaidExternalAccountId = externalAccountId
    assert @@prepaidExternalAccountId > 0
  end

  def test_get
    ea = CorePro::ExternalAccount.get @@prepaidCustomerId, @@prepaidExternalAccountId, @@prepaidConn, nil
    assert_instance_of CorePro::ExternalAccount, ea
    assert_equal @@prepaidExternalAccountId, ea.externalAccountId
  end

  def test_getByTag
    ea = CorePro::ExternalAccount.getByTag @@prepaidCustomerId, "tag #{@@timestamp}", @@prepaidConn, nil
    assert_instance_of CorePro::ExternalAccount, ea
    assert_equal @@prepaidExternalAccountId, ea.externalAccountId
  end

  def test_list
    eas = CorePro::ExternalAccount.list @@prepaidCustomerId, @@prepaidConn, nil
    assert eas != nil && eas.length > 0
  end

  def test_update
    ea = CorePro::ExternalAccount.new
    ea.customerId = @@prepaidCustomerId
    ea.externalAccountId = @@prepaidExternalAccountId
    ea.nickName = "Updated ext act #{@@timestamp}"
    externalAccountId = ea.update @@prepaidConn, nil
    assert_equal @@prepaidExternalAccountId, externalAccountId
  end

end