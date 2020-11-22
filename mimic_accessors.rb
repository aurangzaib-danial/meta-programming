class Person
  class << self
    def attribute_accessor(*attributes)
      attributes.each do |attribute|
        attribute_reader(attribute)
        attribute_writer(attribute)
      end
    end

    def attribute_reader(*attributes)
      attributes.each do |attribute|
        define_method attribute do 
          instance_variable_get("@#{attribute}")
        end
      end
    end

    def attribute_writer(*attributes)
      attributes.each do |attribute|
        define_method "#{attribute}=" do |argument|
          instance_variable_set("@#{attribute}", argument)
        end
      end
    end
  end
end
