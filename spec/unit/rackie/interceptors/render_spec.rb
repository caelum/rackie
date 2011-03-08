require 'test_helper'

class StaticResponse
  def initialize(status, headers, body)
    @status = status
    @headers = headers
    @body = body
  end
  attr_reader :status, :headers, :body
end
describe Rackie::Interceptor::Render do

  it "should go render each process and move forward" do
    log = mock_a :log
    env = {:log => log}
    chain = mock_a :chain
    response = StaticResponse.new(204, {"Content-Type" => "application/xml"}, ["Simple Content"])
    
    log.should_receive(:debug).with(204)
    log.should_receive(:debug).with(response.headers)
    log.should_receive(:debug).with("Simple Content")
    chain.should_receive(:process).with(env, response)

    render = Rackie::Interceptor::Render.new
    render.call(env, chain, response)
  end
  
end