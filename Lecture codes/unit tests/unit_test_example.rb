require "minitest/autorun"
require "./ModelPoint.rb"

# To think about: all the functions in the following class will be
# executed when we call
#
# how are these functions discovered?

class TestPoint < Minitest::Test

  def setup
    @o = Point.new 0, 0
  end
  

  def test_dummy
    assert_equal 0, 0
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
  
end


