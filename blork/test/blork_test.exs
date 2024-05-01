defmodule BlorkTest do
  use ExUnit.Case
  doctest Blork

  test "greets the world" do
    assert Blork.hello() == :world
  end
end
