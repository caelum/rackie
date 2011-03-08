require 'test_helper'

class RackDelegate
  def initialize(app)
    @app = app
  end
  def call(env)
    @app.call(env)
  end
end

describe Rackie::Interceptor::Rack do
  
  context "when running with rack integration" do
  
    it "should be able to wrap a rack lambda" do
      headers = {"Content-type" => "application/html"}
      body = "Well done!"
      response = mock_a :response
      
      stack = Rackie::RunningStack.for([
        Rackie::Interceptor::Rack.new(RackDelegate),
        Rackie::Interceptor::Rack.new(lambda { [200, headers, body] })
        ])
      stack.process({}, response)
    end
  
  end

end
