defmodule Blork do
  @moduledoc """
  Documentation for `Blork`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Blork.hello()
      :world

  """
  def hello do
    :world
  end

  defp private_hello do
    :notworld
  end
end
