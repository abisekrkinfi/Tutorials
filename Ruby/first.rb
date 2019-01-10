
class Greeter
  attr_accessor :names

  def initialize(names="default")
    @names=names
  end

  def welcome

    if @names.nil?
      puts "Nobody to welcome"

    elsif @names.respond_to?("each")

      @names.each do |i|
        puts "Hi ... #{i} !"
      end
    else
      puts "Hello single.. #{@names}"
    end
  end

  def terminate
    if @names.nil?
      puts "Bye Mr.Nobody!!"

    elsif @names.respond_to?("join")
      puts ("Hello #{@names.join(",")}  !")

    else
      puts "Bye Single #{@names}.."
    end
  end
end


if __FILE__== $0

  g1= Greeter.new
  g1.welcome
  g1.terminate

  g1.names=["RK","Hari","Raja","Kala"]
  g1.welcome
  g1.terminate

  g1.names=nil
  g1.welcome
  g1.terminate

  g2=Greeter.new("Check")
  g2.welcome
  g2.terminate

  g2.names=[1,2,3,4]
  g2.welcome
  g2.terminate

  g2.names=nil
  g2.welcome
  g2.terminate
end
