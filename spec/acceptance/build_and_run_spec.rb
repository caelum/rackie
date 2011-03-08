require 'test_helper'

describe Rackie do
  class First
  end
  class Second
  end
  
  it "should run an entire stack" do
    pending "should run the setup in a new fiber or a thread"
    app = Rackie::App.new(9292, First, Second)
    app.run
    result = request('/codes/201')
    result.code.should == 201
  end
end