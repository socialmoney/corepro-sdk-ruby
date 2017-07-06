require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/customer_beneficiary'

class AdCustomerBeneficiaryTest < CoreProTestBase

  def test_create
    cb = CorePro::CustomerBeneficiary.new
    cb.customerId = @@exampleCustomerId
    cb.firstName = 'Freddie'
    cb.lastName = "Mercury Ruby #{@@timestamp}"
    cb.birthDate = '1969-05-05T00:00:00.000+00:00'
    cb.taxId = '123412349'
    @@exampleCustomerBeneficiaryId = cb.create @@exampleConn, nil
    assert @@exampleCustomerBeneficiaryId > 0
  end

  def test_get
    cb = CorePro::CustomerBeneficiary.get @@exampleCustomerId, @@exampleCustomerBeneficiaryId, @@exampleConn, nil
    assert_instance_of CorePro::CustomerBeneficiary, cb
  end

  def test_list
    cbs = CorePro::CustomerBeneficiary.list @@exampleCustomerId, @@exampleConn, nil
    assert cbs.length > 0
  end

  def test_update
    cb = CorePro::CustomerBeneficiary.new
    cb.customerId = @@exampleCustomerId
    cb.customerBeneficiaryId = @@exampleCustomerBeneficiaryId
    cb.firstName = "Freddie #{@@timestamp}"
    cbid = cb.update @@exampleConn, nil
    assert_equal @@exampleCustomerBeneficiaryId, cbid
  end

  def test_zzz_deactivate
    cb = CorePro::CustomerBeneficiary.new
    cb.customerId = @@exampleCustomerId
    cb.customerBeneficiaryId = @@exampleCustomerBeneficiaryId
    cbid = cb.deactivate @@exampleConn, nil
    assert_equal @@exampleCustomerBeneficiaryId, cbid
  end
end