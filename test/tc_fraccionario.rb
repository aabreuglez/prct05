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
        assert_equal("(1/2)", @uno.to_s)
        assert_equal("(3/9)", @dos.to_s)
        assert_equal("(1/3)", @dos.simply.to_s)
        assert_equal("(15/18)", (@uno+@dos).to_s)
        assert_equal("(4/4)", (@uno+@tres).to_s)
        assert_equal("(0/4)", (@uno-@tres).to_s)
        assert_equal("(1/6)", (@tres-@dos).simply.to_s)
        assert_equal("(-1/6)", (@dos-@uno).simply.to_s)
        assert_equal("(1/4)", (@uno*@tres).simply.to_s)
        assert_equal("(1/6)", (@uno*@dos).simply.to_s)
        assert_equal("(3/2)", (@uno/@dos).simply.to_s)
        assert_equal("(1/1)", (@uno/@tres).simply.to_s)
    end
    
    def test_type_check
        assert_raise(RuntimeError) {Fraccionario.new('1','1')}
        assert_raise(RuntimeError) {Fraccionario.new(1,'1')}
        assert_raise(RuntimeError) {Fraccionario.new('1',1)}
        assert_raise(RuntimeError) {Fraccionario.new(1,1.to_s)}
        assert_raise(RuntimeError) {Fraccionario.new(1,1)+1}
        assert_raise(RuntimeError) {Fraccionario.new(2,2)-'a'}
        assert_raise(RuntimeError) {Fraccionario.new(3,3)/Array.new()}
        assert_raise(RuntimeError) {Fraccionario.new(3,3)*{}}
    end
    
    def test_invalid_div
        assert_raise(RuntimeError) {Fraccionario.new(1,0)}
    end
    
    def test_failure
        assert_equal("(3/9)", @uno.to_s)
    end
end