require_relative 'model_base'
module CorePro
  module Models
    class ProgramLimit < ModelBase
      attr_accessor :minimumAmount
      attr_accessor :maximumAmount
      def to_s
        return "min: #{@minimumAmount}, max: #{@maximumAmount}"
      end
    end
  end
end
