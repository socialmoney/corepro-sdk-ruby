require_relative "json_base"
module CorePro
  module Models
    class ModelBase < JsonBase
      attr_accessor :requestId

      def to_s
        vars = self.instance_variables.map{|v|
            "#{v}=#{instance_variable_get(v).inspect}"
        }.join(", ")
        "<#{self.class}: #{vars}>"
      end

    end
  end
end
