require_relative 'models/model_base'
require_relative 'models/customer_verify_request'
require_relative 'models/customer_response'
require_relative 'models/customer_id_only'
require_relative 'models/customer_phone'
require_relative 'models/customer_address'
require_relative 'account'
require_relative 'card'
require_relative 'external_account'

module CorePro
  class Customer < Models::ModelBase

    attr_accessor :customerCount
    attr_accessor :customerId
    attr_accessor :firstName
    attr_accessor :middleName
    attr_accessor :lastName
    attr_accessor :suffix
    attr_accessor :birthDate
    attr_accessor :gender
    attr_accessor :culture
    attr_accessor :tag
    attr_accessor :status
    attr_accessor :createdDate
    attr_accessor :taxId
    attr_accessor :taxIdMasked
    attr_accessor :driversLicenseNumber
    attr_accessor :driversLicenseNumberMasked
    attr_accessor :driversLicenseState
    attr_accessor :driversLicenseIssueDate
    attr_accessor :driversLicenseExpireDate
    attr_accessor :passportNumber
    attr_accessor :passportNumberMasked
    attr_accessor :passportCountry
    attr_accessor :passportIssueDate
    attr_accessor :passportExpireDate
    attr_accessor :emailAddress
    attr_accessor :isActive
    attr_accessor :isLocked
    attr_accessor :lockedDate
    attr_accessor :lockedReason
    attr_accessor :deceasedDate
    attr_accessor :isSubjectToBackupWithholding
    attr_accessor :isOptedInToBankCommunication
    attr_accessor :isDocumentsAccepted
    attr_accessor :customField1
    attr_accessor :customField2
    attr_accessor :customField3
    attr_accessor :customField4
    attr_accessor :customField5
    attr_accessor :accessTypeCode
    attr_accessor :lastModifiedDate
    attr_accessor :lastActivityDate
    attr_accessor :phones
    attr_accessor :addresses
    attr_accessor :accounts
    attr_accessor :externalAccounts
    attr_accessor :cards

    def from_json! json, classDefs
      classDefs = classDefs || {}
      classDefs['phones'] = CorePro::Models::CustomerPhone
      classDefs['addresses'] = CorePro::Models::CustomerAddress
      classDefs['accounts'] = CorePro::Account
      classDefs['externalAccounts'] = CorePro::ExternalAccount
      classDefs['cards'] = CorePro::Card
      super json, classDefs
    end

    def initialize()
      super
      @phones = []
      @addresses = []
      @accounts = []
      @externalAccounts = []
      @cards = []
    end

    def self.list(pageNumber = 0, pageSize = 200, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customer/list?pageNumber=#{pageNumber}&pageSize=#{pageSize}", Customer, connection, loggingObject)
    end

    def self.get(customerId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customer/get/#{customerId}", Customer, connection, loggingObject)
    end

    def self.getByTag(tag, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customer/getByTag/?tag=#{escape(tag)}", Customer, connection, loggingObject)
    end

    def self.getByEmail(emailAddress, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customer/getByEmail/?emailAddress=#{escape(emailAddress)}", Customer, connection, loggingObject)
    end

    def self.search(tag = nil, taxId = nil, passportNumber = nil, driversLicenseNumber = nil, birthDate = nil, emailAddress = nil, lastName = nil, firstName = nil, pageNumber = 0, pageSize = 200, connection = nil, loggingObject = nil)
      c = Customer.new
      c.tag = tag
      c.taxId = taxId
      c.passportNumber = passportNumber
      c.driversLicenseNumber = driversLicenseNumber
      c.birthDate = birthDate
      c.emailAddress = emailAddress
      c.lastName = lastName
      c.firstName = firstName
      c.search(pageNumber, pageSize, connection, loggingObject)
    end

    def search(pageNumber = 0, pageSize = 200, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post("/customer/search?pageNumber=#{pageNumber}&pageSize=#{pageSize}", Customer, self, connection, loggingObject)
    end

    def create(connection = nil, loggingObject = nil)
      cid = CorePro::Utils::Requestor.post('/customer/create', CorePro::Models::CustomerIdOnly, self, connection, loggingObject)
      cid.customerId
    end

    def update(connection = nil, loggingObject = nil)
      cid = CorePro::Utils::Requestor.post('/customer/update', CorePro::Models::CustomerIdOnly, self, connection, loggingObject)
      cid.customerId
    end

    def archive(connection = nil, loggingObject = nil)
      cid = CorePro::Utils::Requestor.post('/customer/archive', CorePro::Models::CustomerIdOnly, self, connection, loggingObject)
      cid.customerId
    end

    def initiate(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.post('/customer/initiate', CorePro::Models::CustomerResponse, self, connection, loggingObject)
    end

    def verify(verificationId, answers, connection = nil, loggingObject = nil)
      cvr = CorePro::Models::CustomerVerifyRequest.new
      cvr.verificationId = verificationId
      cvr.answers = answers
      cvr.verify connection, loggingObject
    end
  end
end
