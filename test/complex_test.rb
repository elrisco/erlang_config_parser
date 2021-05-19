# magic_ball.rb
require 'minitest/autorun'
require_relative '../lib/erlang_config_parser'

class ComplexTest < Minitest::Test

  def parse(string)
    ErlangConfigParser.parse string
  end

  def test_empty_list
    exp = []
    assert_equal exp, parse('[].')
  end

  def test_empty_tuple
    exp = []
    assert_equal exp, parse('{}.')
  end

  def test_list_of_empty_list
    exp = [ [] ]
    assert_equal exp, parse('[ [ ] ].')
    assert_equal exp, parse('[[]].')
  end

  def test_list_with_empty_tuple
    exp = [ [] ]
    assert_equal exp, parse('[ { } ].')
    assert_equal exp, parse('[{}].')
  end

  def test_tuple_with_empty_tuple
    exp = [ [ ] ]
    assert_equal exp, parse('{ { } }.')
    assert_equal exp, parse('{{}}.')
  end

  def test_tuple_with_empty_list
    exp = [ [ ] ]
    assert_equal exp, parse('{ [ ] }.')
    assert_equal exp, parse('{[]}.')
  end


  def test_list_with_lists
    exp = [ :aaa, [], [:bbb, :ccc], :ddd , [[[:eee]]]]
    assert_equal exp, parse('[ aaa, [ ], [ bbb, ccc ], ddd, [[[eee]]] ].')
  end

  def test_tuple_with_tuples
    exp = [ :aaa, [], [:bbb, :ccc], :ddd , [[[:eee]]]]
    assert_equal exp, parse('{ aaa, {}, {bbb, ccc  }, ddd, {{{eee}}} }.')
  end

  def test_list_with_mixed_lists_and_tuples
    exp = [ :aaa, [], [:bbb, :ccc], :ddd , [:eee,[:fff,[:ggg, [:hhh]]]]]
    assert_equal exp, parse('[ aaa, { }, [ bbb, ccc ], ddd, { eee, [fff, { ggg, {hhh}}] }].')
    assert_equal exp, parse('[ aaa, { }, { bbb, ccc }, ddd, [ eee, [fff, { ggg, {hhh}}] ]].')
    assert_equal exp, parse('[ aaa, { }, [ bbb, ccc ], ddd, { eee, [fff, [ ggg, {hhh}]] }].')
  end

end

