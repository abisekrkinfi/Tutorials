def full_name(fname,*oname)
    fname+ oname.join(" ")
end 

puts(full_name("check","hi","hey"))