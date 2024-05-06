defmodule SaucerPreflight do
  @moduledoc """
  Functions for saucer preflight checks
  """

  defp max_flying_load_lbs(), do: 55
  defp kg_to_lb(weight_kg), do: 2.2046 * weight_kg

  defp item_total_lb({weight_kg, :kg, amt}), do: amt * kg_to_lb(weight_kg)
  defp item_total_lb({weight_lb, :lb, amt}), do: amt * weight_lb
  defp item_total_lb(_other), do: raise("invalid input or unknown unit")

  defp below_max_with_total?([], total), do: total < max_flying_load_lbs()

  defp below_max_with_total?([hd | tl], total) do
    current_total = item_total_lb(hd) + total
    current_total < max_flying_load_lbs() and below_max_with_total?(tl, current_total)
  end

  @doc """
  Check if the equipment list is below the maximum load

  Returns `boolean`

  ### Params

  - Equipment list: `list`

  ### Examples

    iex> SaucerPreflight.below_max_load?([{30, :lb, 1}])
    true

    iex> SaucerPreflight.below_max_load?([{30, :kg, 1}])
    false

    iex> SaucerPreflight.below_max_load?([{20, :lb, 1}, {38, :lb, 1}, {40, :lb, 1}])
    false

    iex> SaucerPreflight.below_max_load?([{10, :lb, 8}])
    false
  """
  def below_max_load?(equip_list) do
    below_max_with_total?(equip_list, 0)
  end
end
