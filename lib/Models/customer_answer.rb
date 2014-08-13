require_relative 'model_base'
module CorePro
  module Models
    class CustomerAnswer < ModelBase
      attr_accessor :questionType
      attr_accessor :questionAnswer
    end
  end
end
