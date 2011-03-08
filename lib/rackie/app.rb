require 'rack'
require 'mongrel'

module Rackie
  class A
  end
  class App
    
    def initialize(port, *interceptors)
      @port = port
      @interceptors = interceptors
    end
    
    def run
      my_rack = self
      app = Rack::Builder.new {
        use A
      }.to_app
      Rack::Handler::Mongrel.run(app, :Port => 3000)
    end
    
  end
end