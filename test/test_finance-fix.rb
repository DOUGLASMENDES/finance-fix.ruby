require 'helper'

class TestFinanceFix < Test::Unit::TestCase
  should "be able to instantiate Finance::FIX" do
    assert          Finance::FIX.new
    assert_kind_of  Finance::FIX, Finance::FIX.new
  end

  should "be able to parse a sample FIX message" do
    # From http://en.wikipedia.org/wiki/Financial_Information_eXchange
    msg = "8=FIX.4.29=17835=849=PHLX56=PERS52=20071123-05:30:00.00011=ATOMNOCCC999090020=3150=E39=E55=MSFT167=CS54=138=1540=244=1558=PHLX EQUITY TESTING59=047=C32=031=0151=1514=06=010=128";

    Finance::FIX.new do |fix|
      nodes = fix.parse(msg)
    
      assert_not_nil  nodes,          'parse() returned something'
      assert_equal    25, nodes.size, 'parse() returned right number of nodes'
      assert_equal    '8',        nodes[0][0],  "[0][0]   == '8'"
      assert_equal    'FIX.4.2',  nodes[0][1],  "[0][1]   == 'FIX.4.2'"
      assert_equal    '10',       nodes[24][0], "[24][0]  == '10'"
      assert_equal    '128',      nodes[24][1], "[24][1]  == '128'"
    end
  end

end
