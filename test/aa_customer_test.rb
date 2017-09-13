require_relative 'core_pro_test_base'
require_relative '../lib/corepro/customer'
require_relative '../lib/corepro/models/customer_address'
require_relative '../lib/corepro/models/customer_response'

class AaCustomerTest < CoreProTestBase

  def test_aaa_create
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
    p = CorePro::Models::CustomerPhone.new
    p.phoneType = 'mobile'
    p.number = '515-555-1234'
    c.phones.push(p)

    ra = CorePro::Models::CustomerAddress.new
    ra.addressLine1 = '123 Main Street'
    ra.city = 'Anytown'
    ra.state = 'IA'
    ra.postalCode = '55555'
    ra.addressType = 'residence'
    ra.country = 'US'
    ra.isActive = 1
    c.addresses.push(ra)

    #@@exampleCustomerInitiateResponse = c.initiate(@@exampleConn, nil)
    @@exampleCustomerId = c.create(@@exampleConn, nil)
    puts "customerId=#{@@exampleCustomerId}"
    assert @@exampleCustomerId > 0
  end

#  def test_aaa_verify
#    c = CorePro::Customer.new
#    c.customerId = @@exampleCustomerId
#  end

  def test_get
    puts "getting #{@@exampleCustomerId}..."
    c = CorePro::Customer.get @@exampleCustomerId, @@exampleConn, nil
    assert c != nil, "Could not 'get' customerId #{@@exampleCustomerId}"
  end

  def test_getByTag
    c = CorePro::Customer.getByTag "jfm#{@@timestamp}", @@exampleConn, nil
    assert c != nil, "Could not 'getByTag' tag 'jfm#{@@timestamp}'"
  end

  def test_list
    cs = CorePro::Customer.list 0, 15, @@exampleConn, nil
    assert cs != nil && cs.length > 0, "Could not list customers"
  end

  def test_search
    c = CorePro::Customer.new
    c.lastName = "McTester#{@@timestamp}"
    cs = c.search nil, nil, @@exampleConn, nil
    assert cs != nil && cs.length > 0, "Could not search 'McTester#{@@timestamp}'"
  end

  def test_update
    c = CorePro::Customer.new
    c.customerId = @@exampleCustomerId
    c.firstName = "Joey#{@@timestamp}"
    customerId = c.update @@exampleConn, nil
    assert customerId > 0
  end

end