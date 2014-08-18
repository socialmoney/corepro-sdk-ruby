module CorePro
  class CoreProApiException < StandardError
    def initialize(errors)
      @errors = errors
    end

    attr_accessor :errors

    def firstMessage
      @errors[0].message
    end

    def firstCode
      @errors[0].code
    end

    def to_s
      "#{@errors[0]}. See errors collection for more information."
    end
  end
end
