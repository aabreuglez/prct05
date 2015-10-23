require 'lib/fraccionario'
require 'test/unit'

class TestFraccionario < Test::Unit::TestCase
    def setup
        @uno = Fraccionario.new(1,2)
        @dos = Fraccionario.new(3,9)
        @tres = Fraccionario.new(2,4)
    end
    
    def tear_down
        #Nothing
    end
  
    def test_simple
        assert_equal("(1/2)",@uno.to_s)
        assert_equal("(3/9)",@dos.to_s)
        assert_equal("(1/3)",@dos.simply.to_s)
        assert_equal("(15/18)",(@uno+@dos).to_s)
        assert_equal("(4/4)",(@uno+@tres).to_s)
    end
    
    def test_type_check
        assert_raise(RuntimeError) {Fraccionario.new('1','1')}
    end
end