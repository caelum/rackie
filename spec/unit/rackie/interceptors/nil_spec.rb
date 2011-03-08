require 'test_helper'

describe Rackie::Interceptor::Nil do

  it "should amazingly do nothing." do
    chain = mock_a :chain
    chain.should_not_receive(:process)
    
    response = mock_a :response

    endpoint = Rackie::Interceptor::Nil.new
    endpoint.call({}, chain, response)
  end

end