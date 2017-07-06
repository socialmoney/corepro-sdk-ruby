require_relative 'json_base'
module CorePro
  module Models
    class ProgramAccount < JsonBase

      def is_hash?
        true
      end

      attr_accessor :programAccountId
      attr_accessor :type
      attr_accessor :accountNumber
      attr_accessor :accountNumberMasked
      attr_accessor :description
      attr_accessor :accountBalance
      attr_accessor :isActive

    end
  end
end