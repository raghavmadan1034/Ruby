#modified from the example in the textbook "The Ruby Programming Language"

class HTML
  def initialize
  end
  
  def tag tagname
    if tagname[0..2]=="par"
      tagname="p"
    end
    
    printf "<%s>\n", tagname             # open html tag

     if block_given?
       content = yield
       if content
         puts content.to_s               # also executes inner methods
         printf "</%s>\n", tagname
       end
     else
       printf "\n<%s/>\n",tagname        # empty body, so close tag
     end
    nil
  end


  alias method_missing tag

  #class method
  def self.generate  out, &block
    HTML.new.instance_eval(&block)       # out ignored for now, always stdout
  end
end



