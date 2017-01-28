class HelloWorld
  
   def sayHello
      yield if block_given? #this makes it so you dont always have to pass in a block
      puts "hello again!"
   end

       

end


hello = HelloWorld.new
hello.sayHello {puts "hello world!"} # this becomes our block that happens during yield
hello.sayHello {puts "Hello there!"} # pretty sick bro
hello.sayHello
