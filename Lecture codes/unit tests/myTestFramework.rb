module MyTestFramework
  class Assertion < StandardError
  end

  module MyAssertions
    def assert ( condition, errorMsg = "unexpected value" )
      raise Assertion, errorMsg  unless condition
    end

    def assert_equal ( expected, actual, errorMsg = nil)
      assert( expected==actual, "#{expected.inspect} is not equal to #{actual.inspect}" )
    end
  end


  # add to MyTest module
  def self.all_tests
      @tests = @tests || []
  end

  class MyTest
    include MyAssertions

    # we create a new test case by creating a subclass of MyTest.
    # when we create such a new subclass, Ruby notifies the
    # superclasses by calling .inherited. We use this notification
    # to add the new "Test" - i.e. the subclass, into the list of
    # tests to run. Thus all tests are "auto-discovered".
    def self.inherited(new_subclass)
      MyTestFramework.all_tests << new_subclass
    end

    # if tests need some per-test initialization or cleanup, then
    # they can use before_hook before the test, and after_hook
    # after the test. These _may_ be overridden, but it is not
    # mandatory.
    def before_hook; end
#    def after_hook; end
  end # end class MyTest
end # end Module MyTestFramework


at_exit {
  results = []

  p MyTestFramework.all_tests
  
  # module's variables are public, so we can access
  # .test directly
  MyTestFramework.all_tests.each {
    |test| # note: each test is a class



    test.public_instance_methods.grep( /^test_/ ).each {
      |method|

      test1 = test.new # test is a class, so we can call new

      status = :pass
      detail = nil

      begin
        test1.before_hook
        test1.public_send ( method )
      rescue MyTestFramework::Assertion => e
        status = :fail
        detail = e.message
      rescue => e
        status = :error
        detail = e.message
      ensure
        test1.after_hook
      end

      results << [test,method,status,detail]}}

  p results}

  

    


