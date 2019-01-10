=begin
myRange= 1..10
myr1= 1...10
puts myRange,myr1

puts myRange.min
puts myRange.max

puts myr1.min
puts myr1.max

puts myRange.include?(5)
puts myr1.include?(10)
=end

hm= {1=>'One','2'=>'Two',"Three"=>3}
puts hm[1]
puts hm["2"]
puts hm["Three"]
