defmodule BasicMath do
  def add(addend_1, addend_2), do: addend_1 + addend_2
  def sub(minuend, subtrahand), do: minuend - subtrahand
  def mult(multiplier, multiplicand), do: multiplier * multiplicand
  def div(dividend, divisor), do: dividend / divisor

  def round_up(num) do
    if is_integer(num) do
      num
    else
      Float.ceil(num, 2)
    end
  end
end
