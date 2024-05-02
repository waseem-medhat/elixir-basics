defmodule LinkedList do
  @moduledoc """
  Documentation for `LinkedList`.
  """

  def get_equipment() do
    ["space helmet", "space suit", "snacks", "grappling hook", "probe"]
  end

  def get_first_item(list) do
    hd(list)
  end

  def remove_first_item(list) do
    tl(list)
  end

  def add_slow(list, value) do
    list ++ [value]
  end

  defp prepend(list, value) do
    [value | list]
  end

  def add_fast(list, value) do
    list
    |> Enum.reverse()
    |> prepend(value)
    |> Enum.reverse()
  end

  def remove_item(list, index) do
    List.delete_at(list, index)
  end
end
