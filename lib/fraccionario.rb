class Fraccionario
    attr_reader :a, :b
    def initialize (a, b)
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
            (x < y) ? i = a : i = b
            terminar=true
            j=2 #Obviously 0 is and error and 1 always has mod 0
            while j <= i and !simplified
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
end