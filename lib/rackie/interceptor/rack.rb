module Rackie
  module Interceptor
    
    # A chain proxy that delegates to myself
    class Proxy
      def initialize(rackie)
        @rackie = rackie
      end
      def call(env)
        env[:chain].process(env, env[:response])
      end
    end
    
    # A Rack module wrapper
    class Rack
      def initialize(wrapped, *args)
        puts wrapped.respond_to? :call
        if wrapped.respond_to? :call
          @wrapped = wrapped
        else
          @wrapped = wrapped.new(Proxy.new(self), *args)
        end
      end
      
      def call(env, chain, response)
        env[:chain] = chain
        env[:response] = response
        # this would not work since we need to find the exact position to match older response changing interceptors
        new_response = @wrapped.call(env)
      end
    end
  end
end