require 'test_helper'

class RackDelegate
  def initialize(app)
    @app = app
  end
  def call(env)
    @app.call(env)
  end
end
class RackSetEnv
  def initialize(app)
    @app = app
  end
  def call(env)
    env[:data] = true
    @app.call(env)
  end
end

describe Rackie::Interceptor::Rack do
  
  context "when running with rack integration" do
  
    it "should be able to wrap a rack lambda" do
      headers = {"Content-type" => "application/html"}
      body = "Well done!"
      response = mock_a :response
      
      env = {}
      stack = Rackie::RunningStack.for([
        Rackie::Interceptor::Nil.new,
        Rackie::Interceptor::Rack.for(lambda { [200, headers, body] }, RackSetEnv, RackDelegate),
        Delegate.new])
      stack.process(env, response)
      env[:data].should be_true
    end
  
  end

end
