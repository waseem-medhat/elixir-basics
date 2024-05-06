defmodule ControlFlow do
  def check_max_load(load) do
    # if load < 55, do: "Safe to fly!", else: "Too heavy!"
    unless load >= 55, do: "Safe to fly!", else: "Too heavy!"
  end

  def check_fuel_level(percentage) do
    cond do
      percentage == 100 ->
        "full tank"

      percentage > 75 ->
        "3/4 tank"

      percentage > 49 ->
        "half tank"

      percentage > 24 ->
        "quarter tank"

      true ->
        "empty tank"
    end
  end

  def error_code_check(value) do
    case value do
      200 ->
        :ok

      201 ->
        :created

      204 ->
        :no_content

      n when is_integer(n) and n >= 300 ->
        :error

      _ ->
        :unknown_code
    end
  end

  defp kg_to_lb(kg), do: kg * 2.2

  defguard is_equipment(equipment)
           when is_tuple(equipment) and
                  tuple_size(equipment) == 3 and
                  is_number(elem(equipment, 0)) and
                  elem(equipment, 1) in [:lb, :kg] and
                  is_integer(elem(equipment, 2))

  def equipment_check(equipment_tuple) do
    case equipment_tuple do
      {weight, unit, quantity}
      when is_equipment(equipment_tuple) and weight / quantity < 16 and unit == :kg ->
        :cleared

      {weight, unit, quantity}
      when is_equipment(equipment_tuple) and unit == :lb ->
        if kg_to_lb(weight) / quantity < 16, do: :cleared, else: :failed

      _ ->
        :unknown
    end
  end
end
