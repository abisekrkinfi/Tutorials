=begin
puts `ls`
var1 = 5;
var2 = '2'
puts var1 + var2.to_i

a = 'hello '
a<<'world.
I love this world...'
puts a
=end

=begin
s= gets.chomp
i=s.to_i
puts "What I received is #{s}..."

puts i.class.to_s

puts self
=end

#puts [1,2]
def lower (s)
  s.downcase
end

a="RK"
lower(a)
puts a

def lower (s)
  s.downcase!
end

a="RK"
lower(a)
puts(a)

def fun (*arg,a2)
  arg.inspect
end
