class Visitor
  attr_reader :name, 
              :height, 
              :preferences
              
  attr_accessor :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = adjust_spending_money(spending_money)
    @preferences = []
  end

  def adjust_spending_money(spending_money)
    spending_money[1..-1].to_i
  end

  def add_preference(preference)
    @preferences.push(preference)
  end

  def tall_enough?(height_req)
    height >= height_req
  end
end
