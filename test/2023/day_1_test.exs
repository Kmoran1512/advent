defmodule Day1Year23Test do
  use ExUnit.Case
  doctest Day1Year23

  test "first and last" do
    assert Day1Year23.mapLineToNum("1abc2") == 12
    assert Day1Year23.mapLineToNum("pqr3stu8vwx") == 38
  end

  test "middle number" do
    assert Day1Year23.mapLineToNum("a1b2c3d4e5f") == 15
  end

  test "single number" do
    assert Day1Year23.mapLineToNum("treb7uchet") == 77
  end

  test "summing" do
    assert Day1Year23.parseInput("1abc2\r\npqr3stu8vwx\r\na1b2c3d4e5f\r\ntreb7uchet") == 142
  end

  test "number words" do
    assert Day1Year23.mapLineToNum("two1nine") == 29
    assert Day1Year23.mapLineToNum("7pqrstsixteen") == 76
    assert Day1Year23.mapLineToNum("twone") == 21
  end

  test "summing words" do
    assert Day1Year23.parseInput("two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen") == 281
  end


end
