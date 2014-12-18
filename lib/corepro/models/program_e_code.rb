require_relative 'json_base'
module CorePro
  module Models
    class ProgramECode < JsonBase

      def is_hash?
        true
      end

      attr_accessor :category
      attr_accessor :type
      attr_accessor :programECodeId
      attr_accessor :productCode
      attr_accessor :minimumAmount
      attr_accessor :maximumAmount
      attr_accessor :name
      attr_accessor :imageUrl
      attr_accessor :isReissueSupported

      def initialize
        super
      end

      def from_json! json, classDefs
        classDefs = classDefs || {}

        super json, classDefs
      end
    end
  end
end