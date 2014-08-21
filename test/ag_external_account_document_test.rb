require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/external_account_document'

class AgExternalAccountDocumentTest < CoreProTestBase
  def test_upload
    ead = CorePro::ExternalAccountDocument.new
    ead.customerId = @@prepaidCustomerId
    ead.externalAccountId = @@prepaidExternalAccountId
    ead.documentType = 'DriversLicense'
    ead.documentName = 'test.pdf'
    ead.reasonType = 'NameChange'
    folder = File.expand_path(File.dirname(File.dirname(__FILE__)))
    ead.documentContent = File.read(folder + '/test.pdf')
    ead.upload @@prepaidConn, nil
    assert true

  end
end