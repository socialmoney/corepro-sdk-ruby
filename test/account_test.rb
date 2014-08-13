require_relative "../test/core_pro_test_base"
require "account"
require "external_account"
require "connection"
require "core_pro_api_exception"

class AccountTest # < CoreProTestBase

  def test_list
    accounts = CorePro::Account::list(@@customerId, @@conn, NIL)
    accounts.each{ |a|
      puts a
    }
    assert_equal 1, accounts.length
  end

  def test_get
    a = CorePro::Account::get(@@customerId, @@accountId, @@conn, NIL)
    puts a
    assert_equal '101686', a.accountNumber
  end

  def test_update
    a = CorePro::Account::get(@@customerId, @@accountId, @@conn, NIL)
    a.name = "Testing ruby sdk #{Time.new.inspect}"
    begin
      assert_true a.update(@@conn, NIL)

    rescue CorePro::CoreProApiException => cpaex
      puts cpaex.to_s
      raise
    rescue Exception => ex
      puts ex.to_s
      raise
    end
  end
end