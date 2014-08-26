require_relative 'models/model_base'
require_relative 'models/customer_beneficiary_id_only'

module CorePro
  class CustomerBeneficiary < Models::ModelBase

    attr_accessor :customerId
    attr_accessor :customerBeneficiaryId
    attr_accessor :firstName
    attr_accessor :lastName
    attr_accessor :birthDate
    attr_accessor :taxId
    attr_accessor :taxIdMasked
    attr_accessor :isActive

    def self.list(customerId, connection = nil, loggingObject = nil)
      cb = CustomerBeneficiary.new
      cb.customerId = customerId
      cb.list connection, loggingObject
    end

    def list(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customerbeneficiary/list/#{self.customerId}", CustomerBeneficiary, connection, loggingObject)
    end

    def self.get(customerId, customerBeneficiaryId, connection = nil, loggingObject = nil)
      cb = CustomerBeneficiary.new
      cb.customerId = customerId
      cb.customerBeneficiaryId = customerBeneficiaryId
      cb.get connection, loggingObject
    end

    def get(connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customerbeneficiary/get/#{self.customerId}/#{self.customerBeneficiaryId}", CustomerBeneficiary, connection, loggingObject)
    end

    def create(connection = nil, loggingObject = nil)
      cbid = CorePro::Utils::Requestor.post('/customerbeneficiary/create', CorePro::Models::CustomerBeneficiaryIdOnly, self, connection, loggingObject)
      cbid.customerBeneficiaryId
    end

    def update(connection = nil, loggingObject = nil)
      cbid = CorePro::Utils::Requestor.post('/customerbeneficiary/update', CorePro::Models::CustomerBeneficiaryIdOnly, self, connection, loggingObject)
      cbid.customerBeneficiaryId
    end

    def deactivate(connection = nil, loggingObject = nil)
      cbid = CorePro::Utils::Requestor.post('/customerbeneficiary/deactivate', CorePro::Models::CustomerBeneficiaryIdOnly, self, connection, loggingObject)
      cbid.customerBeneficiaryId
    end

  end
end
