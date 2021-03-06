require 'rackie'
require 'restfulie'

def request(uri)
  Restfulie.at("http://localhost:9292#{uri}").get
end

class Mocked
  def initialize(what)
    @what = what
  end
  def to_s
    "[a mocked #{@what}]"
  end
end

def mock_an(what)
  Mocked.new(what)
end
def mock_a(what)
  Mocked.new(what)
end

class Delegate
  def call(env, chain, response)
    chain.process(env, response)
  end
end

# probably useful to extract to the lib itself
class StaticResponse
  def initialize(status, headers, body)
    @status = status
    @headers = headers
    @body = body
  end
  attr_reader :status, :headers, :body
end
