
class Dog
  def initialize (a="b",b=1)
    @breed=a
    @age=b
  end

  def details
    puts "My breed is #{@breed} and my age is #{@age}"
  end

end

=begin
ob= Dog.new("Hai",1)
puts ob.object_id

o2=ob
o2.details
ob=nil

o2.details
o2=nil
#ob.details

o3= Dog.new
puts o3.details
=end
