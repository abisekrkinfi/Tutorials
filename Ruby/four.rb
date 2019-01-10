=begin
val=2

case
when val==1 then puts "1"
when val==2 then puts "2"
when val==3 then puts "3"
else puts "above 3"

end
=end

def fun
  puts "This is me"

  if block_given?
    yield
  else
    puts "No block associated"
  end
end

fun {puts "hello"}
fun
fun do x=1 end
  
