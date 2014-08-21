require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/transfer'

class AjTransferPrepaidTest < CoreProTestBase

  def test_create_external_to_internal
    t = CorePro::Transfer.new
    t.customerId = @@prepaidCustomerId
    t.fromId = @@prepaidExternalAccountId
    t.toId = @@prepaidAccountId
    t.amount = 1.25
    results = t.create @@prepaidConn, nil
    @@prepaidExternalToInternalTransactionId = results[0].transactionId
    assert @@prepaidExternalToInternalTransactionId > 0
  end

  def test_create_internal_to_external
    t = CorePro::Transfer.new
    t.customerId = @@prepaidCustomerId
    t.fromId = @@prepaidAccountId
    t.toId = @@prepaidExternalAccountId
    t.amount = 1.20
    results = t.create @@prepaidConn, nil
    @@prepaidInternalToExternalTransactionId = results[0].transactionId
    assert @@prepaidInternalToExternalTransactionId > 0
  end

  # def test_void
  #   t = CorePro::Transfer.new
  #   t.customerId = @@prepaidCustomerId
  #   t.transactionId = @@prepaidExternalToInternalTransactionId
  #   t.void @@prepaidConn, nil
  # end
end