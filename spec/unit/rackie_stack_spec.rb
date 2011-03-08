require 'test_helper'

describe Rackie::Stack do

  before do
    @env = mock_an :env
    @response = mock_a :response
  end

  it "should go through the entire stack" do
    asserter = mock_an :interceptor
    
    stack = Rackie::Stack.new(Delegate.new, asserter)
    
    asserter.should_receive(:call).with(@env, an_instance_of(Rackie::RunningStack), @response)
    stack.process(@env, @response)
  end
  
end