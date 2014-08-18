require_relative "../test/core_pro_test_base"
require_relative  "../lib/corepro/customer"
require_relative  "../lib/corepro/connection"
require_relative  "../lib/corepro/core_pro_api_exception"

class CustomerTest < CoreProTestBase


  def test_get
    puts 'test_get'
    c = CorePro::Customer.get @@customerId, @@conn, nil
    puts c
  end

  def test_getByTag
    puts 'test_getByTag'
    c = CorePro::Customer.getByTag 'jsmith123abc'
    puts c
  end

  def test_search
    puts 'test_search'
    cs = CorePro::Customer.search nil,  lastName = 'Smith'
    cs.each do | x |
      puts x
    end
  end

  def test_list
    puts 'test_list'
    cs = CorePro::Customer.list 0, 15, @@conn, nil
    cs.each do |x|
      puts x
    end
  end

  def test_update
    c = CorePro::Customer.get @@customerId, @@conn, nil
    puts "test_update. orig gender = #{c.gender}"
    c.gender = c.gender == 'M' ? 'F' : 'M'
    c.update @@conn
    c = CorePro::Customer.get @@customerId, @@conn, nil
    puts "test_update. new gender = #{c.gender}"
  end

end