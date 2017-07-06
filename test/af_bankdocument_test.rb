require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/bank_document'
require_relative '../lib/corepro/models/file_content'

class AfBankDocumentTest < CoreProTestBase
  def test_list
    docs = CorePro::BankDocument.list 'en-US', nil, @@exampleConn, nil
    doc = nil
    docs.each do |x|
      doc = x # if x.documentType == 'eStatement'
    end
    @@documentId = doc.documentId
    assert_instance_of CorePro::BankDocument, doc
  end

  def test_zzz_download
    doc = CorePro::BankDocument.download 'en-US', @@documentId, @@exampleConn, nil
    assert_instance_of CorePro::Models::FileContent, doc
  end
end