# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
    base.instance_variable_set(:@attributes, {})
  end

  module ClassMethods
    def attribute(name, options = {})
      attributes[name] = options

      define_method("#{name}=") do |value|
        @values[name] = convert(value, options[:type])
      end

      define_method(name) do
        if @values.key?(name)
          @values[name]
        else
          default = options[:default]
          default.nil? ? nil : convert(default, options[:type])
        end
      end
    end

    def attributes
      @attributes ||= {}
    end
  end

  def initialize(attrs = {})
    @values = {}

    attrs.each do |key, value|
      key = key.to_sym
      send("#{key}=", value) if self.class.attributes.key?(key)
    end
  end

  def attributes
    self.class.attributes.each_with_object({}) do |(key, _), result|
      result[key] = send(key)
    end
  end

  private

  def convert(value, type)
    return nil if value.nil? || type.nil?

    converter = type_converters[type.name]
    converter ? converter.call(value) : value
  end

  def type_converters
    {
      "string"   => ->(v) { v.to_s },
      "integer"  => ->(v) { v.to_i },
      "float"    => ->(v) { v.to_f },
      "symbol"   => ->(v) { v.to_sym },
      "datetime" => ->(v) { DateTime.parse(v.to_s) },
      "boolean" => ->(v) { !!v }
    }
  end
end
# END
