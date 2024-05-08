defmodule Bitstrings do
  # fly to base => FB
  # fly to earth => FE
  # hover => H
  # tractor beam ON => T
  # tractor beam OFF => O

  defp encode_instruction(code_point) do
    case code_point do
      ?H -> 0b0000
      ?F -> 0b0001
      ?B -> 0b0010
      ?E -> 0b0100
      ?T -> 0b1000
      ?O -> 0b0011
    end
  end

  def encode(instructions, encoded_value \\ <<0::size(0)>>)
  def encode([], encoded_value), do: encoded_value

  def encode([h | t], encoded_value) do
    encode(t, <<encoded_value::bitstring, encode_instruction(h)::4>>)
  end

  defp decode_byte(byte) do
    case byte do
      0b0000 -> ?H
      0b0001 -> ?F
      0b0010 -> ?B
      0b0100 -> ?E
      0b1000 -> ?T
      0b0011 -> ?O
    end
  end

  def decode(encoded_instructions) do
    case encoded_instructions do
      <<>> ->
        ~c""

      <<b::size(4), rest::bitstring>> ->
        [decode_byte(b) | decode(rest)]
    end
  end
end
