require_relative "ModelPoint"


# ==================================================
# an implementation of the Proxy pattern in this particular case, the
# _first time_ a method is called, and before the method executes, we
# log to the console. The logic does not seem to work for logging
# _every_ time a method is called, since the send will cause an
# infinite loop.
# ==================================================
class BeforeProxy

  #add the object to be proxied.
  def initialize(obj)
    @obj = obj
  end

  #=====
  # Note: calling proxy_point.to_s will not trigger method_missing,
  # since proxy_point already has a to_s. In order to disable this, we
  # remove to_s from proxy_point.
  #=====
  undef to_s


  def method_missing(name, *args)
    puts "calling method #{name} with #{args}"

    
    if args.empty?
      @obj.send name
    #      @obj.instance_eval name
    #      @obj.instance_exec { name }
    else
      #      @obj.send name, args
      @obj.instance_exec { |args| name args}
    end
  end
end

point       = Point.new 0, 0 
proxy_point = BeforeProxy.new point
str = proxy_point.to_s
puts str

