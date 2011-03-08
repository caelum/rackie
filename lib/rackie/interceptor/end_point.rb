module Rackie
  module Interceptor
    class EndPoint
      def call(env, chain, response)
        response.body.close if response.body.respond_to?(:close)
      end
    end
  end
end