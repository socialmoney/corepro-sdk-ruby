require_relative 'core_pro_test_base'
require_relative '../lib/corepro/program'

class AaaProgramTest < CoreProTestBase
  def test_get
    puts @@prepaidConn
    p = CorePro::Program.get @@prepaidConn, nil
    puts p.prepaidProducts['Prepaid']
    assert_equal 'CoreProPrepaidTester', p.name
  end
end