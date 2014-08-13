require_relative 'model_base'
require_relative 'customer_message'
require_relative 'customer_question'

module CorePro
  module Models
    class CustomerResponse < ModelBase
      attr_accessor :customerId
      attr_accessor :messages
      attr_accessor :questions
      attr_accessor :verificationId
      attr_accessor :verificationStatus

      def from_json! json, classDefs
        classDefs = classDefs || {}
        classDefs['messages'] = CustomerMessage
        classDefs['questions'] = CustomerQuestion
        super json, classDefs
      end

      def initialize
        @messages = []
        @questions = []
      end
    end
  end
end
