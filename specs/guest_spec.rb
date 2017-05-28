require("minitest/autorun")
require("minitest/rg")

require_relative("../guest")

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Sam DaBell")
  end

  def test_get_name
    assert_equal("Sam DaBell", @guest.name)
  end

end