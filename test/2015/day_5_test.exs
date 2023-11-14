defmodule Day5Year15Test do
  use ExUnit.Case
  doctest Day5Year15

  test "simple nice string" do
    assert Day5Year15.is_nice_str?("ugknbfddgicrmopn") == true
  end

  test "aaa" do
    assert Day5Year15.is_nice_str?("aaa") == true
  end

  test "no double" do
    assert Day5Year15.is_nice_str?("jchzalrnumimnmhp") == false
  end

  test "xy" do
    assert Day5Year15.is_nice_str?("haegwjzuvuyypxyu") == false
  end

  test "one vowel" do
    assert Day5Year15.is_nice_str?("dvszwmarrgswjxmb") == false
  end

  test "two lines" do
    msg = "dzhklewjqzmrfzsw\r\nyxgeypduywntnbji\r\nbadunwkeggdkcgco"
    assert Day5Year15.count_nice_strings(msg) == 1
  end
end

defmodule Day5Year15Test_2 do
  use ExUnit.Case
  doctest Day5Year15_2

  test "simple nice string" do
    assert Day5Year15_2.is_nice_str?("qjhvhtzxzqqjkmpb") == true
  end

  test "short nice string" do
    assert Day5Year15_2.is_nice_str?("xxyxx") == true
  end

  test "no broken repeat" do
    assert Day5Year15_2.is_nice_str?("uurcxstgmygtbstg") == false
  end

  test "no double pair" do
    assert Day5Year15_2.is_nice_str?("ieodomkazucvgmuy") == false
  end

  test "two lines" do
    msg = "qjhvhtzxzqqjkmpb\r\nieodomkazucvgmuy"
    assert Day5Year15_2.count_nice_strings(msg) == 1
  end
end
