require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/customer'
require_relative '../lib/corepro/models/customer_response'

class AaCustomerNachaTest # < CoreProTestBase

  def test_aaa_initiate
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

    @@nachaCustomerInitiateResponse = c.initiate(@@nachaConn, nil)
    @@nachaCustomerId = @@nachaCustomerInitiateResponse.customerId

    assert @@nachaCustomerId > 0
  end

  def test_aaa_verify
    c = CorePro::Customer.new
    c.customerId = @@nachaCustomerId

  end

  def test_get
    c = CorePro::Customer.get @@nachaCustomerId, @@nachaConn, nil
    assert c != nil, "Could not 'get' customerId #{@@nachaCustomerId}"
  end

  def test_getByTag
    c = CorePro::Customer.getByTag "jfm#{@@timestamp}", @@nachaConn, nil
    assert c != nil, "Could not 'getByTag' tag 'jfm#{@@timestamp}'"
  end

  def test_list
    cs = CorePro::Customer.list 0, 15, @@nachaConn, nil
    assert cs != nil && cs.length > 0, "Could not list customers"
  end

  def test_search
    c = CorePro::Customer.new
    c.lastName = "McTester#{@@timestamp}"
    cs = c.search nil, nil, @@nachaConn, nil
    assert cs != nil && cs.length > 0, "Could not search 'McTester#{@@timestamp}'"
  end

  def test_update
    c = CorePro::Customer.new
    c.customerId = @@nachaCustomerId
    c.firstName = "Joey#{@@timestamp}"
    customerId = c.update @@nachaConn, nil
    assert customerId > 0
  end

end