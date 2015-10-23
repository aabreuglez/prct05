class Fraccionario
    attr_reader :a, :b
    def initialize (a, b)
        @a, @b = a, b
    end
    
    def to_s
        "(#{@a}/#{@b})"
    end
end