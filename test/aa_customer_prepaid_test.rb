require_relative '../test/core_pro_test_base'
require_relative  '../lib/corepro/customer'

class AaCustomerPrepaidTest < CoreProTestBase

  def test_create

    c = CorePro::Customer.new
    c.birthDate = '01/01/1985'
    c.culture = 'en-US'
    c.firstName = 'Joey'
    c.middleName = 'Flanagan'
    c.lastName = "McTester#{@@timestamp}"
    c.gender = 'M'
    c.isDocumentsAccepted = true
    c.isSubjectToBackupWithholding = false
    c.isOptedInToBankCommunication = false
    c.tag = "jfm#{@@timestamp}"
    c.taxId = '012341234'

    @@prepaidCustomerId = c.create(@@prepaidConn, nil)
    assert @@prepaidCustomerId > 0
  end

  def test_get
    c = CorePro::Customer.get @@prepaidCustomerId, @@prepaidConn, nil
    assert c != nil, "Could not 'get' customerId #{@@prepaidCustomerId}"
  end

  def test_getByTag
    c = CorePro::Customer.getByTag "jfm#{@@timestamp}", @@prepaidConn, nil
    assert c != nil, "Could not 'getByTag' tag 'jfm#{@@timestamp}'"
  end

  def test_list
    cs = CorePro::Customer.list 0, 15, @@prepaidConn, nil
    assert cs != nil && cs.length > 0, "Could not list customers"
  end

  def test_search
    c = CorePro::Customer.new
    c.lastName = "McTester#{@@timestamp}"
    cs = c.search nil, nil, @@prepaidConn, nil
    assert cs != nil && cs.length > 0, "Could not search 'McTester#{@@timestamp}'"
  end

  def test_update
    c = CorePro::Customer.new
    c.customerId = @@prepaidCustomerId
    c.firstName = "Joey#{@@timestamp}"
    customerId = c.update @@prepaidConn, nil
    assert customerId > 0
  end

end