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
      def self.for(*stack)
        Rack.new(stack)
      end
      def initialize(stack)
        @stack = stack.dup
      end
      
      def call(env, chain = nil, response = nil)
        if(chain)
          # not being invoked by some rack middleware
          chain.process(env, invoke_next(env))
        else
          invoke_next(env)
        end
      end
      
      private
      def invoke_next(env)
        current = @stack.pop
        current = current.new(self) unless current.respond_to? :call
        current.call(env)
      end
    end
  end
end