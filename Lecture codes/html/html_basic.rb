#modified from the example in the textbook "The Ruby Programming Language"

class HTML
  def initialize
  end

  def output(tagname,&block)
    if block_given?
      puts "<"+tagname+">"
      content=yield
      if content
        puts content.to_s
      end
      puts "</"+tagname+">"
    else
      puts "<"+tagname+"/>"
    end
  end
  

  def head(&block) 
   if block_given?
      puts "<head>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</head>"
    else
      puts "<head/>"
    end
  end

  def html(&block)
   if block_given?
      puts "<html>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</html>"
    else
      puts "<html/>"
    end
    
  end

  def title(&block)
   if block_given?
      puts "<title>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</title>"
    else
      puts "<title/>"
    end

  end

  def body(&block)
   if block_given?
      puts "<body>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</body>"
    else
      puts "<body/>"
    end

  end

  def ul(&block)
   if block_given?
      puts "<ul>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</ul>"
    else
      puts "<ul/>"
    end
  end

  def li(&block)
   if block_given?
      puts "<li>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</li>"
    else
      puts "<li/>"
    end

  end

  def table(&block)
   if block_given?
      puts "<table>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</table>"
    else
      puts "<table/>"
    end

  end

  def tr(&block)
   if block_given?
      puts "<tr>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</tr>"
    else
      puts "<tr/>"
    end

  end

  def td(&block)
   if block_given?
      puts "<td>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</td>"
    else
      puts "<td/>"
    end

  end
  
  def h1(&block)
   if block_given?
      puts "<h1>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</h1>"
    else
      puts "<h1/>"
    end

  end

  def par(&block)
   if block_given?
      puts "<p>"
      content=yield
      if content
        puts content.to_s
      end
      puts "</p>"
    else
      puts "<p/>"
    end

  end
  

  #class method
  def self.generate  out, &block
    HTML.new.instance_eval(&block)       # out ignored for now, always stdout
  end


  
end



