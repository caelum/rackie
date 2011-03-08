module Rackie
  module Interceptor
    # An interceptor that finishes a chain by doing nothing
    class Nil
      def call(env, chain, response)
      end
    end
  end
end
