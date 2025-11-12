puts 'Hello World'                  # self is main
puts self
class A
  puts self                         # self is now the class A

  def name=(str)
    p 'inside A\'s name='
   @name = str                      # instance method. when it is
                                    # called, self will be the receiver
   self.puts self                 
  end
end

class B < A
  def name=(str)
    p 'inside B\'s name='
    puts self
    puts "super = #{super}"
    super
  end
end


puts 'Hi there'                     # self is main
puts self
a = A.new

a.name=("Hello")                      # when a.name= executes, self
                                    # changes to a. Check the output 
                                    # to see that self changes during
                                    # the method call.

b = B.new
b.name=("Hello B!")
# p (b.respond_to? :puts)
# p (b.respond_to? :to_s)
# b.puts "Hello World! from B"



