
class Test
  def fun (*a)

    if a.size==1
      puts "1 argument"
    elsif a.size==2
      puts "2 argument"

    else
      puts "More than 2 arguments"
    end

  end
end
=begin
  def fun(a,b)
    puts "2 argument"
  end

  def fun (a,b,c)
    puts "3 argument"
  end
=end



t= Test.new
t.fun(1)
#t.fun(1,2,3)
t2=Test.new
t2.fun(1,23,3)
