require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/customer_document'

class AeCustomerDocumentTest < CoreProTestBase
  def test_upload
    cd = CorePro::CustomerDocument.new
    cd.customerId = @@exampleCustomerId
    cd.documentType = 'DriversLicense'
    cd.reasonType = 'NameChange'
    cd.documentName = 'test.pdf'
    folder = File.expand_path(File.dirname(File.dirname(__FILE__)))
    cd.documentContent = File.read(folder + '/test.pdf')
    cd.upload @@exampleConn, nil
    assert true
  end
end