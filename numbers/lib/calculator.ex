defmodule Calculator do
  def find_percentage(percentage, value) do
    percentage
    |> BasicMath.div(100)
    |> BasicMath.mult(value)
    |> BasicMath.round_up()
  end

  def find_distance(speed, time) do
    # speed = distance / time
    speed
    |> BasicMath.mult(time)
    |> BasicMath.round_up()
  end
end

