defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator 

  describe "find_percentage/2 works" do
    test "100 returns same number" do
      assert Calculator.find_percentage(100, 5) == 5
    end

    test "fractional percentages" do
      assert Calculator.find_percentage(50, 5) === 2.5
      assert Calculator.find_percentage(10, 3) == 0.31
    end
  end

  describe "find_distance/2 works" do
    test "" do
      assert Calculator.find_distance(50, 5) == 250
    end
  end



end
