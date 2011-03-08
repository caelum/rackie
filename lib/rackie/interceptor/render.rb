# just a sample render example
# to be substituted with delegators to rack's connectors
module Rackie
  module Interceptor
    class Render
      def call(env, chain, response)
        env[:log].debug response.status
        env[:log].debug response.headers
 
        response.body.each do |string|
          env[:log].debug string
        end
 
        chain.process(env, response)
      end
    end
  end
end