class Fraccionario
    attr_reader :a, :b
    def initialize (a, b)
        if( !a.is_a? Integer or !b.is_a? Integer) 
            raise
        end
        raise unless b!=0
        @a, @b = a, b
    end
    
    def to_s
        "(#{@a}/#{@b})"
    end
    
    def simply
       terminar = false #This bool will tell us when we can't simplify more
       simplified = false
       x=@a
       y=@b
       while (!terminar)
            (x.abs < y.abs) ? i = a : i = b
            terminar=true
            simplified=false
            j=2 #Obviously 0 is and error and 1 always has mod 0
            while j <= i.abs and !simplified
                if ( (x % j == 0) and (y % j == 0) )
                    x=x/j
                    y=y/j
                    simplified=true
                    terminar=false
                end
                j+=1
            end
       end
       Fraccionario.new(x,y)
       #Concatenamos el metodo to s
    end
    
    def +(other)
        #There is a .lcm method on integer for calculate the MCM
        Fraccionario.new((@a * (@b.lcm(other.b)/@b)) + (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b))
    end
    
    def -(other)
       Fraccionario.new((@a * (@b.lcm(other.b)/@b)) - (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b)) 
    end
end