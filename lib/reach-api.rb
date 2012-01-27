module Reach
  class << self

    # Alias for Reach::API.new
    #
    # Returns a Reach::API object
    def new(options)
      Reach::API.new(options)
    end

    # Delegate to Reach::API
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end

  autoload :API,     "reach/api"
  autoload :Helper,  "reach/helper"
  autoload :Version, "reach/version"
end
