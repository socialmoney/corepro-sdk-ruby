require_relative '../test/core_pro_test_base'
require_relative '../lib/corepro/card'

require 'openssl'
require 'base64'

class AlCardTest < CoreProTestBase

  def test_create
    c = CorePro::Card.new
    c.customerId = @@exampleCustomerId
    c.primaryAccountId = @@exampleAccountId
    c.tag = "card ruby #{@@timestamp}"
    c.nickName = "Card #{@@timestamp}"
    c.firstName = 'Frank'
    c.lastName = 'Drummond'
    c.vendorTypeCode = 'VS'

    rawPin = '1234'
    publicKey = OpenSSL::PKey::RSA.new(File.read('q2labs_public.pem'))
    c.newPin = encrypted_string = Base64.encode64(publicKey.public_encrypt(rawPin, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING))
    puts "#{rawPin}, #{c.newPin}"
    newCard = c.initiate @@exampleConn, nil
    @@exampleCardId = newCard.cardId
    puts "cardId=#{@@exampleCardId}"
    assert @@exampleCardId > 0

  end

  def test_list
    accounts = CorePro::Account.list(@@exampleCustomerId, @@exampleConn, nil)
    assert_equal 1, accounts.length, "Listed #{accounts.length} accounts for customerId=#{@@exampleCustomerId}"
  end

  def test_get
    puts "getting #{@@exampleAccountId}..."
    a = CorePro::Account.get(@@exampleCustomerId, @@exampleAccountId, @@exampleConn, nil)
    assert_equal 'CategoryB', a.subCategory
  end

  def test_update
    a = CorePro::Account.get(@@exampleCustomerId, @@exampleAccountId, @@exampleConn, nil)
    a = CorePro::Account.new
    a.accountId = @@exampleAccountId
    a.customerId = @@exampleCustomerId
    a.name = "Updated account #{@@timestamp}"
    accountId = a.update @@exampleConn, nil
    assert accountId == @@exampleAccountId
  end

end