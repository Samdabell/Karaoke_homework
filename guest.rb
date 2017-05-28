class Guest

  def initialize(name, money)
      @name = name
      @money = money
  end

  def name()
    return @name
  end

  def money()
    return @money
  end

  def spend(amount)
    @money -= amount
  end
end