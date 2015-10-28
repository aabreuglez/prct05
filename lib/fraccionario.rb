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
    gcd = 1
    x = @a
    y = @b
    j = 2 #0 is an error and 1 always has mod 0
    
    (x.abs < y.abs) ? i = x.abs : i = y.abs #Use abs value because 1 may be negative!
    
    while j <= i
      if ((x % j == 0) and (y % j == 0))
        gcd = j
      end
      j += 1
    end
      x = x / gcd
      y = y / gcd
    Fraccionario.new(x,y)
  end
  
  def +(other)
    #There is a method on Integer class for calculating the MCM .lcm
    raise unless other.is_a? Fraccionario
    Fraccionario.new((@a * (@b.lcm(other.b)/@b)) + (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b))
  end
  
  def -(other)
    raise unless other.is_a? Fraccionario
    Fraccionario.new((@a * (@b.lcm(other.b)/@b)) - (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b)) 
  end
  
  def *(other)
    raise unless other.is_a? Fraccionario
    Fraccionario.new( (@a * other.a) , (@b * other.b) )
  end
  
  def /(other)
    raise unless other.is_a? Fraccionario
    Fraccionario.new( (@a * other.b), (@b * other.a) )
  end
end