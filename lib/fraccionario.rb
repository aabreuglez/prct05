class Fraccionario
  attr_reader :a, :b
  def initialize (a, b)
    
    #Type check
    raise unless a.is_a? Integer and b.is_a? Integer
    #Avoid 0 division
    raise unless b != 0
    
    @a, @b = a, b
  end
  
  def to_s
    "(#{@a}/#{@b})"
  end
  
  def simply
    terminar = false #This bool will tell us when we can't simplify more
    simplified = false #This bool will help us to restart the loop of simplifying
    x = @a
    y = @b
    
    while !terminar
      (x.abs < y.abs) ? i = a : i = b #Use abs value because 1 may be negative!
      terminar = true 
      simplified = false
      j = 2 #0 is an error and 1 always has mod 0
      while j <= i.abs and !simplified 
        if ((x % j == 0) and (y % j == 0))
          x = x / j
          y = y / j
          #We should restart everytime we simplified because f.e 18 can be divide by three multiple times
          simplified = true
          terminar = false
        end
        j += 1
      end
    end
    
    Fraccionario.new(x,y)
  end
  
  def +(other)
    #There is a method on Integer class for calculating the MCM .lcm 
    Fraccionario.new((@a * (@b.lcm(other.b)/@b)) + (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b))
  end
  
  def -(other)
    Fraccionario.new((@a * (@b.lcm(other.b)/@b)) - (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b)) 
  end
  
  def *(other)
    Fraccionario.new( (@a * other.a) , (@b * other.b) )
  end
  
  def /(other)
    Fraccionario.new( (@a * other.b), (@b * other.a) )
  end
end