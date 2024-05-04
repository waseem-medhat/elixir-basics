defmodule Guards do
  @moduledoc """
  Doing stuff with guards
  """
  def type(value) when is_integer(value), do: :integer
  def type(value) when is_float(value), do: :float
  def type(_value) when true, do: :not_number

  def is_single_digit(value) when is_integer(value) and value < 10, do: true
  def is_single_digit(value) when not is_integer(value) or value >= 10, do: false

  defguardp is_even(value) when is_integer(value) and rem(value, 2) === 0

  def return_even_numbers(value \\ :empty)
  def return_even_numbers(value) when is_even(value), do: value
  def return_even_numbers(value) when not is_even(value), do: :not_even
end
