require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/program'

class AhProgramTest < CoreProTestBase
  def test_get
    p = CorePro::Program.get @@prepaidConn, nil
    assert_equal 'CoreProPrepaidTester', p.name
  end
end