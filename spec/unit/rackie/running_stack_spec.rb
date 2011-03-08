require 'test_helper'

describe Rackie::RunningStack do

  before do
    @env = mock_an :env
    @response = mock_a :response
  end

  it "should go through the entire stack" do
    processor = mock_a :running_stack
    
    Rackie::RunningStack.should_receive(:for).with([Delegate]).and_return(processor)
    processor.should_receive(:process).with(@env, @response)
    stack = Rackie::Stack.new(Delegate)
    stack.process(@env, @response)
  end
  
end