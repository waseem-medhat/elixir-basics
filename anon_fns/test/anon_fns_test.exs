defmodule AnonFnsTest do
  use ExUnit.Case
  doctest AnonFns

  test "greets the world" do
    assert AnonFns.hello() == :world
  end
end
