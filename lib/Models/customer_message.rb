require_relative 'model_base'

module CorePro
  module Models
    class CustomerMessage < ModelBase
      attr_accessor :verificationId
      attr_accessor :verificationMessage
    end
  end
end
