require_relative '../CorePro/Models/model_base'
require_relative '../CorePro/connection'
require_relative '../CorePro/Models/customer_verify_request'
require_relative '../CorePro/Models/customer_response'
require_relative '../CorePro/Models/customer_id_only'
require_relative '../CorePro/Models/customer_phone'
require_relative '../CorePro/Models/customer_address'
require_relative 'account'
require_relative 'external_account'

module CorePro
  class Customer < Models::ModelBase

    attr_accessor :customerCount
    attr_accessor :customerId
    attr_accessor :firstName
    attr_accessor :middleName
    attr_accessor :lastName
    attr_accessor :birthDate
    attr_accessor :gender
    attr_accessor :culture
    attr_accessor :tag
    attr_accessor :status
    attr_accessor :createdDate
    attr_accessor :taxId
    attr_accessor :driversLicenseNumber
    attr_accessor :driversLicenseState
    attr_accessor :driversLicenseExpirationDate
    attr_accessor :passportNumber
    attr_accessor :passportCountry
    attr_accessor :emailAddress
    attr_accessor :isActive
    attr_accessor :isLocked
    attr_accessor :lockedDate
    attr_accessor :lockedReason
    attr_accessor :isSubjectToBackupWithholding
    attr_accessor :isOptedInToBankCommunication
    attr_accessor :isDocumentsAccepted
    attr_accessor :phones
    attr_accessor :addresses
    attr_accessor :deceasedDate
    attr_accessor :accounts
    attr_accessor :externalAccounts

    def from_json! json, classDefs
      classDefs = classDefs || {}
      classDefs['phones'] = CorePro::Models::CustomerPhone
      classDefs['addresses'] = CorePro::Models::CustomerAddress
      classDefs['accounts'] = CorePro::Account
      classDefs['externalAccounts'] = CorePro::ExternalAccount
      super json, classDefs
    end

    def initialize()
      @phones = []
      @addresses = []
      @accounts = []
      @externalAccount = []
    end

    def self.list(pageNumber = 0, pageSize = 200, connection = nil, loggingObject = nil)
      Customer.new.list pageNumber, pageSize, connection, loggingObject
    end

    def list(pageNumber = 0, pageSize = 200, connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.get("/customer/list?pageNumber=#{pageNumber}&pageSize=#{pageSize}", Customer, connection, loggingObject)
    end

    def self.get(customerId, connection = nil, loggingObject = nil)
      c = Customer.new
      c.customerId = customerId
      c.get(connection, loggingObject)
    end

    def get(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.get("/customer/get/#{self.customerId}", Customer, connection, loggingObject)
    end

    def self.getByTag(tag, connection = nil, loggingObject = nil)
      c = Customer.new
      c.tag = tag
      c.getByTag(connection, loggingObject)
    end

    def getByTag(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.get("/customer/getByTag/#{self.tag}", Customer, connection, loggingObject)
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
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post("/customer/search?pageNumber=#{pageNumber}&pageSize=#{pageSize}", Customer, self, connection, loggingObject)
    end

    def create(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post('/customer/create', Customer, self, connection, loggingObject)
    end

    def update(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post('/customer/update', CorePro::Models::CustomerIdOnly, self, connection, loggingObject)
    end

    def self.deactivate(customerId, connection = nil, loggingObject = nil)
      c = Customer.new
      c.customerId = customerId
      c.deactivate(connection, loggingObject)
    end

    def deactivate(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post('/customer/deactivate', CorePro::Models::CustomerIdOnly, self, connection, loggingObject)
    end

    def initiate(connection = nil, loggingObject = nil)
      connection ||= Connection.createFromConfig()
      CorePro::Utils::Requestor.post('/customer/initiate', CorePro::Models::CustomerResponse, self, connection, loggingObject)
    end

    def self.verify(verificationId, answers, connection = nil, loggingObject = nil)
      cvr = CorePro::Models::CustomerVerifyRequest.new
      cvr.verificationId = verificationId
      cvr.answers = answers
      cvr.verify connection, loggingObject
    end

    def verify(verificationId, answers, connection = nil, loggingObject = nil)
      cvr = CorePro::Models::CustomerVerifyRequest.new
      cvr.verificationId = verificationId
      cvr.answers = answers
      cvr.verify connection, loggingObject
    end
  end
end
