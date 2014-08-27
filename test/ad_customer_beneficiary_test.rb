require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/customer_beneficiary'

class AdCustomerBeneficiaryTest < CoreProTestBase

  def test_create
    cb = CorePro::CustomerBeneficiary.new
    cb.customerId = @@prepaidCustomerId
    cb.firstName = 'Freddie'
    cb.lastName = "Mercury Ruby #{@@timestamp}"
    cb.birthDate = '1969-05-05T00:00:00.000+00:00'
    cb.taxId = '123412349'
    @@prepaidCustomerBeneficiaryId = cb.create @@prepaidConn, nil
    assert @@prepaidCustomerBeneficiaryId > 0
  end

  def test_get
    cb = CorePro::CustomerBeneficiary.get @@prepaidCustomerId, @@prepaidCustomerBeneficiaryId, @@prepaidConn, nil
    assert_instance_of CorePro::CustomerBeneficiary, cb
  end

  def test_list
    cbs = CorePro::CustomerBeneficiary.list @@prepaidCustomerId, @@prepaidConn, nil
    assert cbs.length > 0
  end

  def test_update
    cb = CorePro::CustomerBeneficiary.new
    cb.customerId = @@prepaidCustomerId
    cb.customerBeneficiaryId = @@prepaidCustomerBeneficiaryId
    cb.firstName = "Freddie #{@@timestamp}"
    cbid = cb.update @@prepaidConn, nil
    assert_equal @@prepaidCustomerBeneficiaryId, cbid
  end

  def test_zzz_deactivate
    cb = CorePro::CustomerBeneficiary.new
    cb.customerId = @@prepaidCustomerId
    cb.customerBeneficiaryId = @@prepaidCustomerBeneficiaryId
    cbid = cb.deactivate @@prepaidConn, nil
    assert_equal @@prepaidCustomerBeneficiaryId, cbid
  end
end