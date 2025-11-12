
# The superclass Collection specifies that the functions
# mentioned must be implemented by subclasses.

class Collection
  def add elt
    raise NotImplementedError
  end
  def size
    raise NotImplementedError
  end
  def empty?
    raise NotImplementedError
  end
  def each &block
    raise NotImplementedError
  end
  def method_missing method_name, *args, &block
    puts "inside Collection: looking up #{method_name} failed"
    super
  end
end

class OrderedCollection < Collection
  def initialize
    @elements = []
  end
  def add elt
    @elements << elt
  end
  def empty?
    @elements.empty?
  end
  def each &block
    @elements.each &block
  end
  def first
    @elements.first
  end
  def last
    @elements.last
  end
  def method_missing method_name, *args, &block
    puts "inside OrderedCollection: looking up #{method_name} failed"
    super
  end

end

#====================================
# The class SortedCollection enumerates elements in
# sorted order. It takes as an optional parameter, a block
# which can be used to compare two elements. If this is
# provided, then the elements are maintained in this
# sorted order. Otherwise, there is a default sorted order.
#
# Please see descendingCollection to see an example
# where a custom comparison is used for sorting
#======================================
class SortedCollection < OrderedCollection
  def initialize &comparator
    super
    if comparator
      @comparator = comparator  
    else
      @comparator = ->(a,b) {a<=>b} # Proc for default sort
    end
  end
  def add elt
    super elt # use the ordered collections add
    @elements = @elements.sort &@comparator # then sort the collection
  end
  def method_missing method_name, *args, &block
    puts "inside SortedCollection: looking up #{method_name} failed"
    super
  end

end


class MockSet < Collection
  def initialize
    @elements = []
  end
  # maintains at most one occurrence of elt
  def add elt
    if (@elements.find_index elt)==nil
      @elements << elt
    end
  end
  def empty?
    @elements.empty?
  end
  def each &block
    @elements.each &block
  end
end


class MockBag < Collection
  def initialize
    @elements = []
  end
  def add elt
    @elements << elt
  end
  def empty?
    @elements.empty?
  end
  def each &block
    @elements.each &block
  end
end


#==============================
# calling instance methods on Collection instances
# may produce exceptions: for example, add
# will raise an exception. To think: new does not
# raise an exception, because initialize is
# implemented in Object, and not overridden in
# Collection
#==============================
begin
  c = Collection.new
  c.add 1
rescue NotImplementedError
  puts "please call the method in a subclass"
end

      

puts "========== orderedCollection ===================="
oc = OrderedCollection.new
oc.add 1
oc.add 2
oc.add 12
oc.add 4
oc.each { |i| puts i }

puts "============== ascendingCollection ===================="
ascendingCollection = SortedCollection.new
ascendingCollection.add 1
ascendingCollection.add 2
ascendingCollection.add 12
ascendingCollection.add 4
ascendingCollection.each { |i| puts i }
puts "First element:" + ascendingCollection.first.to_s

puts "============== descendingCollection ===================="
descendingCollection = SortedCollection.new {|a,b| b<=>a}
descendingCollection.add 1
descendingCollection.add 2
descendingCollection.add 12
descendingCollection.add 4
descendingCollection.each { |i| puts i }
puts "First element:" + descendingCollection.first.to_s

puts "============== set ===================="
set = MockSet.new
set.add 1
set.add 2
set.add 1
set.each { |i| puts i }

puts "========== bag ===================="
bag = MockBag.new
bag.add 1
bag.add 2
bag.add 1
bag.each { |i| puts i }

puts "===== method lookup ================="
ascendingCollection.kalgoorlie
