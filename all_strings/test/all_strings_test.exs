defmodule AllStringsTest do
  use ExUnit.Case
  doctest AllStrings

  test "greets the world" do
    assert AllStrings.hello() == :world
  end
end
