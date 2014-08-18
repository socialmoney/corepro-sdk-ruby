require_relative 'model_base'
module CorePro
  module Models
    class FileContent < ModelBase
      attr_accessor :content
      attr_accessor :contentType
      attr_accessor :contentLength
    end
  end
end
