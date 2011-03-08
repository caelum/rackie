module Rackie
  class Stack
    
    def initialize(*interceptors)
      @interceptors = interceptors
    end
    
    def process(env, response)
      RunningStack.new(@interceptors.dup).process(env, response)
    end
    
  end
end