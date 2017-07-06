require_relative 'json_base'
module CorePro
  module Models
    class ProgramExternalAccount < JsonBase

      def is_hash?
        true
      end

      attr_accessor :programExternalAccountId
      attr_accessor :type
      attr_accessor :routingNumber
      attr_accessor :accountNumber
      attr_accessor :accountNumberMasked
      attr_accessor :description
      attr_accessor :nachaName
      attr_accessor :isActive

    end
  end
end