module Rackie
  class RunningStack
    
    def self.for(stack)
      RunningStack.new(stack)
    end
    
    def initialize(interceptors)
      @interceptors = interceptors
    end
    
    def process(env, response)
      current = @interceptors.pop
      current.call(env, self, response)
    end
    
  end
end