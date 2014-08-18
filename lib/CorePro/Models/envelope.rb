require_relative 'model_base'
require_relative 'api_error'

module CorePro
  module Models
    class Envelope < ModelBase
      attr_accessor :data
      attr_accessor :errors
      attr_accessor :status
      attr_accessor :rawRequestBody
      attr_accessor :rawResponseBody

      def from_json! json, classDefs = {}
        classDefs = classDefs || {}
        classDefs['errors'] = CorePro::Models::ApiError
        super json, classDefs

        if classDefs.has_key?('data')
          if @data.kind_of?(Array)
            @data.each {|item|
              if item.instance_variable_defined?('@requestId')
                item.requestId = @requestId
              end
            }
          else
            if @data.instance_variable_defined?('@requestId')
              @data.requestId = @requestId
            end
          end
        end

        self

      end
    end
  end
end
