require 'lib/fraccionario'
require 'test/unit'

class TestFraccionario < Test::Unit::TestCase
    def setup
        @uno = Fraccionario.new(1,2)
        @dos = Fraccionario.new(3,9)
    end
    
    def test_simple
        assert_equal("(1/2)",@uno.to_s)
        assert_equal("(3/9)",@dos.to_s)
    end
end