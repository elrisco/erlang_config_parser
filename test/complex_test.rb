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

  def test_list_with_maps
    exp = [ {a: 1}, {b: 2, c:3}]
    assert_equal exp, parse('[ #{ a=>1}, #{ b => 2,c=> 3 } ].')
  end

  def test_maps_with_complex_keys
    exp = { [:a, 1] => 2, [:b,:c,:d] => 4, {e: 5} => 6}
    assert_equal exp, parse('#{ [a,1] => 2, {b,c,d} => 4, #{e => 5} => 6 }.')
  end
end

