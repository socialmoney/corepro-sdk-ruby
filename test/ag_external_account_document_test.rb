require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/external_account_document'

class AgExternalAccountDocumentTest < CoreProTestBase
  def test_upload
    ead = CorePro::ExternalAccountDocument.new
    ead.customerId = @@exampleCustomerId
    ead.externalAccountId = @@exampleExternalAccountId
    ead.documentType = 'DriversLicense'
    ead.documentName = 'test.pdf'
    ead.reasonType = 'NameChange'
    folder = File.expand_path(File.dirname(File.dirname(__FILE__)))
    ead.documentContent = File.read(folder + '/test.pdf')
    ead.upload @@exampleConn, nil
    assert true

  end
end