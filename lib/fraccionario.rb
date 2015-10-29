class Fraccionario
  attr_reader :a, :b
  def initialize (*args)
    
    if args.length == 1
      raise unless args[0].is_a? Integer
      @a, @b = args[0], 1  
      
    elsif args.length == 2
    
      raise unless args[0].is_a? Integer and args[1].is_a? Integer #Type check
      raise unless args[1] != 0 #Avoid 0 division
      @a, @b = args[0], args[1]
    else
      raise
    end
    
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
    raise unless other.is_a? Fraccionario or other.is_a? Integer
    if other.is_a? Fraccionario
      Fraccionario.new((@a * (@b.lcm(other.b)/@b)) + (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b))
    else
      Fraccionario.new((@a + other*@b), @b)
    end
  end
  
  def -(other)
    raise unless other.is_a? Fraccionario or other.is_a? Integer
    if other.is_a? Fraccionario
      Fraccionario.new((@a * (@b.lcm(other.b)/@b)) - (other.a * (@b.lcm(other.b)/other.b)) , @b.lcm(other.b)) 
    else
      Fraccionario.new((@a - other*@b), @b)
    end
  end
  
  def *(other)
    raise unless other.is_a? Fraccionario or other.is_a? Integer
    if other.is_a? Fraccionario
      Fraccionario.new( (@a * other.a) , (@b * other.b) )
    else
      Fraccionario.new( (@a * a) , @b)
    end
  end
  
  def /(other)
    raise unless other.is_a? Fraccionario or (other.is_a? Integer and other != 0)
    if other.is_a? Fraccionario
      Fraccionario.new( (@a * other.b), (@b * other.a) )
      
    else
      Fraccionario.new( @a, @b * other)
    end
  end
end