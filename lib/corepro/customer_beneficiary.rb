require_relative 'models/model_base'
require_relative 'models/customer_beneficiary_id_only'

module CorePro
  class CustomerBeneficiary < Models::ModelBase

    attr_accessor :customerId
    attr_accessor :customerBeneficiaryId
    attr_accessor :firstName
    attr_accessor :middleName
    attr_accessor :lastName
    attr_accessor :birthDate
    attr_accessor :taxId
    attr_accessor :taxIdMasked
    attr_accessor :isActive
    attr_accessor :lastModifiedDate

    def self.list(customerId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customerbeneficiary/list/#{customerId}", CustomerBeneficiary, connection, loggingObject)
    end

    def self.get(customerId, customerBeneficiaryId, connection = nil, loggingObject = nil)
      CorePro::Utils::Requestor.get("/customerbeneficiary/get/#{customerId}/#{customerBeneficiaryId}", CustomerBeneficiary, connection, loggingObject)
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
