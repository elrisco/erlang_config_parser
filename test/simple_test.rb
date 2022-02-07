# magic_ball.rb
require 'minitest/autorun'
require_relative '../lib/erlang_config_parser'

class SimpleTest < Minitest::Test

  def parse(string)
    ErlangConfigParser.parse string
  end

  def test_empty
    exp = []
    assert_equal exp, parse('[].')
  end

  def test_atom_with_variations
    exp = [ :abc ]
    assert_equal exp, parse('[abc].')
    assert_equal exp, parse('[ abc ].')
    assert_equal exp, parse(' [ abc ]. ')
    assert_equal exp, parse(" \t\n [ \t\n abc \t\n] \n\t .  \n \t")
  end

  def test_numbers
    exp = [ 1, 2.34 ]
    assert_equal exp, parse('[ 1, 2.34 ].')
  end

  def test_strings
    exp = [ "aaa", "bb", "cccc", "d dd d" ]
    assert_equal exp, parse('[ "aaa", "bb", "cccc", "d dd d" ].')
  end

  def test_bit_strings
    exp = [ "aaa" , "b b"]
    assert_equal exp, parse('[ <<"aaa">>, <<"b b">> ].')
  end

  def test_tuple_empty
    exp = [ [] ]
    assert_equal exp, parse('[ { } ].')
  end

  def test_tuple
    exp = [ [:aaa, 1, 2.34, "bbb" ] ]
    assert_equal exp, parse('[ { aaa, 1, 2.34, "bbb" } ].')
  end

end

