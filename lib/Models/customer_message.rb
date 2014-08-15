require_relative 'json_base'

module CorePro
  module Models
    class CustomerMessage < JsonBase
      attr_accessor :verificationId
      attr_accessor :verificationMessage
    end
  end
end
