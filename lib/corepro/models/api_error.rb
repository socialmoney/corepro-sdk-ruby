require_relative 'json_base'

module CorePro
  module Models
    class ApiError < JsonBase
      attr_accessor :code
      attr_accessor :message

      def to_s
        "code: #{@code}, message: #{@message}"
      end
    end
  end
end
