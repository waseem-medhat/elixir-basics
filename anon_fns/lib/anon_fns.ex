defmodule AnonFns do
  def get_equipment() do
    [:space_helmet, :space_suit, :snacks, :grappling_hook, :probe]
  end

  def get_first_item(equip_list) do
    first = fn [hd | _tl] -> hd end
    first.(equip_list)
  end

  def item_details(:space_helmet), do: {3, :kg, 1}
  def item_details(:space_suit), do: {16, :kg, 1}
  def item_details(:snacks), do: {1, :kg, 16}
  def item_details(:grappling_hook), do: {4, :kg, 1}
  def item_details(:probe), do: {2, :lb, 1}

  def get_weight_lb(list) do
    get_lbs = fn item ->
      {wt, unit, _qty} = item_details(item)

      case unit do
        :lb -> wt
        :kg -> wt * 2.2
        _ -> wt
      end
    end

    Enum.map(list, get_lbs)
  end

  def atom_to_str(list) do
    convert = fn x ->
      x
      |> to_string()
      |> String.upcase()
      |> String.replace("_", " ")
    end

    Enum.map(list, convert)
  end
end
