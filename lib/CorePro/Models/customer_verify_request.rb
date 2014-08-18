require_relative 'model_base'
require_relative '../Utils/requestor'
require_relative 'customer_response'
require_relative 'customer_answer'

module CorePro
  module Models
    class CustomerVerifyRequest < ModelBase
      attr_accessor :customerId
      attr_accessor :verificationId
      attr_accessor :answers

      def from_json! json, classDefs
        classDefs = classDefs || {}
        classDefs['answers'] = CustomerAnswer
        super json, classDefs
      end

      def initialize
        @answers = []
      end

      def verify(connection = NIL, loggingObject = NIL)
        connection = connection || Connection.createFromConfig()
        CorePro::Utils::Requestor.post('/customer/verify', CustomerResponse, self, connection, loggingObject)
      end
    end
  end
end
