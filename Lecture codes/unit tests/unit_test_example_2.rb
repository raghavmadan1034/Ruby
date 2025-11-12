require_relative "MyTestFramework.rb"
require_relative "ModelPoint.rb"

# This code uses the custom framework.
# See also: MyTestFramework.rb for the testing framework, and
# ModelPoint.rb for the point class  
class TestPoint < MyTestFramework::MyTest

  def before_hook
    @o = Point.new 0, 0
  end
  

  def test_get
    assert_equal @o.x, 0
    assert_equal @o.y, 0
  end

  def test_set_get
    @o.x= 1
    @o.y= 2
    assert_equal @o.x, 1
    assert_equal @o.y, 2
  end

  def test_fail
    assert_equal @o.x, 1000
  end

  def test_to_s
    assert_equal @o.to_s, "(1,2)"
  end

  def after_hook; end
end


