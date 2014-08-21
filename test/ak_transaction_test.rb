require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/transaction'

class AkTransactionTest < CoreProTestBase
  def test_list
    ts = CorePro::Transaction.list @@prepaidCustomerId, @@prepaidAccountId, nil, nil, nil, nil, nil, @@prepaidConn, nil
    assert ts.length > 0
  end
end