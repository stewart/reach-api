module Reach
  class Helper

    # Public: Converts a string or key from CamelCase to snake_case
    #
    # value - the string or key to be converted
    #
    # Example:
    #
    #    Reach::Helper::to_snake_case("CamelCase")
    #    #=> "camel_case"
    #
    #    Reach::Helper::to_snake_case(:CamelCase)
    #    #=> :camel_case
    #
    # Returns the snake_cased string or key
    def self.to_snake_case(value)
      case value
        when Symbol
          lowercase(value.to_s).to_sym
        when String
          lowercase(value)
        else
          false
      end
    end

    # Public: Converts a hash or array's keys from CamelCase to snake_case
    #
    # value - the hash or array to have it's keys converted
    #
    # Example:
    #
    #    Reach::Helper::to_snake_case({:hashKey => "hashValue"})
    #    #=> {:hash_key => "hashValue"}
    #
    # Returns the hash/array with snake_case'd keys
    def self.convert_keys(value)
      case value
        when Array
          value.map(&method(:convert_keys))
        when Hash
          Hash[value.map { |k, v| [to_snake_case(k), convert_keys(v)] }]
        else
          value
      end
    end

    private

    # Private: Converts a string from CamelCase to snake_case
    #
    # string - the string to be converted
    #
    # Returns the snake_cased string
    def self.lowercase(string)
      string.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end
  end
end
