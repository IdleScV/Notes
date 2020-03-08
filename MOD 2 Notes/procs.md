Proc 
Anonymous Functions vs Named functions
~~
Basic example of a Proc
    times3 = Proc.new {|n| n * 3}

    puts time3.call(100) => 300



Basic method written with proc
    def generate_times(factor)
        return Proc.new {|n| n* factor} 
    end

    times3 = generate_times(3)
    times5 = generate_times(5)

    puts times3.call(10) => 30
    puts times5.call(100) => 500
<!-- !!                              -->
Using rails in Proc for data validations