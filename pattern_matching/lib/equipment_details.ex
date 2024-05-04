defmodule EquipmentDetails do
  @doc """
  Get Blork's equipment list.

  Returns `list`

  ### Examples

    iex> EquipmentDetails.get_equipment_list()
    [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  """
  def get_equipment_list() do
    [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  end

  @doc """
  For a given item, get the details related to that piece of equipment.

  ### Examples

    iex> EquipmentDetails.item_details(:snacks)
    {1, :kg, 15}

    iex> EquipmentDetails.item_details("jetpack")
    ** (RuntimeError) unknown item
  """
  def item_details(:space_helmet), do: {3, :kg, 1}
  def item_details(:space_suit), do: {16, :kg, 1}
  def item_details(:snacks), do: {1, :kg, 15}
  def item_details(:grappling_hook), do: {4, :kg, 1}
  def item_details(:probe), do: {1, :kg, 1}
  def item_details(_other), do: raise("unknown item")
end
