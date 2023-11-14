defmodule Day3Year15Test do
  use ExUnit.Case
  doctest Day3Year15

  test "one step" do
    assert Day3Year15.unique_houses(">") == 2
  end

  test "one double" do
    assert Day3Year15.unique_houses("^>v<") == 4
  end

  test "back and forth" do
    assert Day3Year15.unique_houses("^v^v^v^v^v") == 2
  end

  test "r two step" do
    assert Day3Year15.robo_unique_houses("^v") == 3
  end

  test "r small loop" do
    assert Day3Year15.robo_unique_houses("^>v<") == 3
  end

  test "r running away" do
    assert Day3Year15.robo_unique_houses("^v^v^v^v^v") == 11
  end
end
