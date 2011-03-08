require 'test_helper'

describe Rackie::Stack do

  before do
    @request = mock_a :request
    @response = mock_a :response
  end

  it "should go through the entire stack" do
    asserter = mock_an :interceptor
    asserter.should_receive(:call).with(@request, @response)
    Rackie::Stack.new(Delegate.new, asserter).run(request, response)
  end
  
end