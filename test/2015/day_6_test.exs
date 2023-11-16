defmodule Day6Year15Test do
  use ExUnit.Case
  doctest Day6Year15

  test "all" do
    assert Day6Year15.apply_lights("turn on 0,0 through 999,999") == 1_000_000
  end

  test "first 1000" do
    assert Day6Year15.apply_lights("toggle 0,0 through 999,0") == 1000
  end

  test "no change" do
    assert Day6Year15.apply_lights("turn off 499,499 through 500,500") == 0
  end

  test "quick toggle" do
    assert Day6Year15.apply_lights("turn on 0,0 through 999,999\r\ntoggle 0,0 through 999,0") ==
             999_000
  end
end
