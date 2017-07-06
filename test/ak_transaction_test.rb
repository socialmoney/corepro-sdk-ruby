require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/transaction'

class AkTransactionTest < CoreProTestBase
  def test_01_list
    ts = CorePro::Transaction.list @@exampleCustomerId, @@exampleAccountId, nil, nil, nil, nil, nil, @@exampleConn, nil
    assert ts.length > 0
  end

  def test_02_get
    ts = CorePro::Transaction.get @@exampleCustomerId, @@exampleProgramReserveToInternalTransactionId, @@exampleConn, nil
    assert ts.length > 0
  end

  def test_03_getByTag
    ts = CorePro::Transaction.getByTag @@exampleCustomerId, @@exampleExternalToInternalTransactionTag, @@exampleConn, nil
    assert ts.length > 0
  end
end