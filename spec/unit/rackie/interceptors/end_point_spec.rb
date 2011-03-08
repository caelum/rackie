require 'test_helper'

describe Rackie::Interceptor::EndPoint do

  it "should close the response body if closeable" do
    closeable_body = mock_a :body
    closeable_body.should_receive(:close)
    
    response = StaticResponse.new(204, {}, closeable_body)
    
    chain = mock_a :chain
    chain.should_not_receive(:process)

    endpoint = Rackie::Interceptor::EndPoint.new
    endpoint.call({}, chain, response)
  end
  
  it "should do nothing if the response body is non closeable" do
    response = StaticResponse.new(204, {}, ["Simple Content"])
    chain = mock_a :chain
    chain.should_not_receive(:process)

    endpoint = Rackie::Interceptor::EndPoint.new
    endpoint.call({}, chain, response)
  end
  
end