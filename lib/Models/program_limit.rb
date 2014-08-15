require_relative 'json_base'
module CorePro
  module Models
    class ProgramLimit < JsonBase
      attr_accessor :minimumAmount
      attr_accessor :maximumAmount
      def to_s
        return "min: #{@minimumAmount}, max: #{@maximumAmount}"
      end
    end
  end
end
