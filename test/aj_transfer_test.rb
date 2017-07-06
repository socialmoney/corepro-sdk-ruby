require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/transfer'

class AjTransferTest < CoreProTestBase

  def test_01_create_external_to_internal
    t = CorePro::Transfer.new
    t.customerId = @@exampleCustomerId
    t.fromId = @@exampleExternalAccountId
    t.toId = @@exampleAccountId
    t.amount = 2.75
    t.tag = "e_2_i #{@@timestamp}"
    @@exampleExternalToInternalTransactionTag = t.tag
    results = t.create @@exampleConn, nil
    @@exampleExternalToInternalTransactionId = results[0].transactionId
    puts "external to internal transactionid=#{@@exampleExternalToInternalTransactionId}"
    assert @@exampleExternalToInternalTransactionId > 0
  end

  def test_02_create_programreserve_to_internal
    t = CorePro::Transfer.new
    t.customerId = @@exampleCustomerId
    t.fromId = @@exampleProgramReserveAccountId
    t.toId = @@exampleAccountId
    t.amount = 1.25
    t.tag = "pr_2_i #{@@timestamp}"
    results = t.create @@exampleConn, nil
    @@exampleProgramReserveToInternalTransactionId = results[0].transactionId
    puts "program reserve to internal transactionid=#{@@exampleProgramReserveToInternalTransactionId}"
    assert @@exampleProgramReserveToInternalTransactionId > 0
  end

  def test_03_create_internal_to_external
    t = CorePro::Transfer.new
    t.customerId = @@exampleCustomerId
    t.fromId = @@exampleAccountId
    t.toId = @@exampleExternalAccountId
    t.amount = 1.20
    t.tag = "i_2_e #{@@timestamp}"
    results = t.create @@exampleConn, nil
    @@exampleInternalToExternalTransactionId = results[0].transactionId
    puts "internal to external transactionid=#{@@exampleInternalToExternalTransactionId}"
    assert @@exampleInternalToExternalTransactionId > 0
  end


  # def test_void
  #   t = CorePro::Transfer.new
  #   t.customerId = @@prepaidCustomerId
  #   t.transactionId = @@prepaidExternalToInternalTransactionId
  #   t.void @@prepaidConn, nil
  # end
end