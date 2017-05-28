require("minitest/autorun")
require("minitest/rg")

require_relative("../guest")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Sam DaBell", 45)
  end

  def test_get_name()
    assert_equal("Sam DaBell", @guest.name())
  end

  def test_get_money()
    assert_equal(45, @guest.money())
  end

  def test_spend()
    @guest.spend(10)
    assert_equal(35, @guest.money())
  end

end