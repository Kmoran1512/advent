defmodule Day1Year23Test do
  use ExUnit.Case
  doctest Day1Year23

  test "first and last" do
    assert Day1Year23.mapLineToNum("1abc2", 12)
    assert Day1Year23.mapLineToNum("pqr3stu8vwx", 38)
  end

  test "middle number" do
    assert Day1Year23.mapLineToNum("a1b2c3d4e5f", 15)
  end

  test "single number" do
    assert Day1Year23.mapLineToNum("treb7uchet", 77)
  end
end
