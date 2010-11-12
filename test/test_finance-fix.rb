require 'helper'

class TestFinanceFix < Test::Unit::TestCase
  should "be able to instantiate Finance::FIX" do
    assert          Finance::FIX.new
    assert_kind_of  Finance::FIX, Finance::FIX.new
  end
end
