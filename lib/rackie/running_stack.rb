module Rackie
  class RunningStack
    
    def initialize(interceptors)
      @interceptors = interceptors
    end
    
    def process(env, response)
      current = @interceptors.pop
      current.call(env, self, response)
    end
    
  end
end