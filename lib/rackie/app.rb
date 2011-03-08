require 'rack'

module Rackie
  class App
    
    def initialize(port, *interceptors)
      @port = port
      @interceptors = interceptors
    end
    
    def to_rack_app
      my_rack = self
      app = Rack::Builder.new {
        use my_rack
      }.to_app
    end
    
  end
end