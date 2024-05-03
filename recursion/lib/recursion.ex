defmodule Recursion do
  @moduledoc """
  Documentation for `Recursion`.
  """

  @doc """
  Make Blork's basic equipment list

  Returns `list`

  ### Examples

    iex> Recursion.get_equipment_list()
    ["Space Helmet", "Space Suit", "Snacks", "Grappling Hook", "Probe"]

  """
  def get_equipment_list() do
    ["Space Helmet", "Space Suit", "Snacks", "Grappling Hook", "Probe"]
  end

  @doc """
  Print each item of the given list.

  Returns `nil`

  ### Params
  - `list`
  """
  def loop([]), do: nil
  def loop([head | tail]) do
    IO.puts(head)
    loop(tail)
  end

  @doc """
  Count each item in the given list.

  Returns `integer`

  ### Params
  - `list`

  ### Examples
    iex> Recursion.count_equipment([])
    0

    iex> Recursion.count_equipment(["a"])
    1

    iex> Recursion.count_equipment(["a", "b", "a"])
    3
  """
  def count_equipment([]), do: 0

  def count_equipment([_head | tail]) do
    1 + length(tail)
  end

  def format_equipment_list([]), do: []

  def format_equipment_list([head | tail]) do
    [
      head
      |> String.downcase()
      |> String.replace(" ", "_")
      | format_equipment_list(tail)
    ]
  end

  def count_item([], _item), do: 0

  def count_item([item | tail], item), do: 1 + count_item(tail, item)

  def count_item([_head | tail], item), do: count_item(tail, item)
end
