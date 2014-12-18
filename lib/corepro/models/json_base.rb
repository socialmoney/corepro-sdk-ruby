require 'json'

module CorePro
  module Models
    class JsonBase
      def is_hash?
        false
      end

      def to_hash
        hash = {}
        self.instance_variables.each do |var|
          val = self.instance_variable_get var
          if val != nil
            if val.instance_of?(Array)
              arr = []
              val.each do |x|
                arr.push(x.to_hash)
              end
              hash[var.to_s.delete('@')] = arr
            else
              hash[var.to_s.delete('@')] = val
            end
          end
        end

        hash
      end

      def to_json
        hash = {}
        self.instance_variables.each do |var|
          val = self.instance_variable_get var
          if val != nil
            if val.instance_of?(String)
              hash[var.to_s.delete('@')] = val
            elsif val.instance_of?(Array)
              # do not serialize empty arrays.  no point.
              if val.length > 0
                arr = []
                val.each do |x|
                  h = x.to_hash
                  arr.push h
                end
                hash[var.to_s.delete('@')] = arr
              end
            else
              hash[var.to_s.delete('@')] = val.to_json
            end
          end
        end
        hash.to_json
      end



      def from_json! json, classDefs = nil
        classDefs = classDefs || {}
        json.each do |var, val|
          # if self.instance_variable_defined?("@#{var}")
          cd = nil
          cd = classDefs[var] if classDefs.has_key? var
          if cd == nil
            self.instance_variable_set "@#{var}", val
          else
            if val.kind_of?(Array)
              arr = []
              val.each do |x|
                item = cd.new
                item.from_json! x, nil
                arr.push item
              end
              self.instance_variable_set "@#{var}", arr
            elsif cd.new.is_hash?
            # elsif val.kind_of?(Hash)
              hash = {}
              val.each do |key, itemJson|
                item = cd.new
                item.from_json! itemJson, nil
                hash[key] = item
              end
              self.instance_variable_set "@#{var}", hash
            else
              item = cd.new
              item.from_json! val, nil
              self.instance_variable_set "@#{var}", item
            end
          end
        end
      end
    end
  end
end
