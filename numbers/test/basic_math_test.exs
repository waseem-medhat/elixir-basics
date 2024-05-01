defmodule BasicMathTest do
  use ExUnit.Case
  doctest BasicMath

  describe "add/2" do
    test "returns correct sum" do
      assert BasicMath.add(4, 5) == 9
      assert BasicMath.add(4.3, 89.4) == 93.7
      assert BasicMath.add(2, 3) == 5
    end
  end

  describe "sub/2" do
    test "returns correct subtraction" do
      assert BasicMath.sub(20, 3) == 17
      assert BasicMath.sub(4, 5) == -1
      assert BasicMath.sub(1.3, 9.4) == -8.1
    end
  end

  describe "mult/2" do
    test "returns correct subtraction" do
      assert BasicMath.mult(20, 3) == 60
      assert BasicMath.mult(4, -5) == -20
      assert BasicMath.mult(1.3, 10) === 13.0
    end
  end
end
