defmodule Day1Year15Test do
  use ExUnit.Case
  doctest Day1Year15

  test "no movement" do
    assert_parentheses_count("(())", 0)
    assert_parentheses_count("()()", 0)
  end

  test "up 3" do
    assert_parentheses_count("(((", 3)
    assert_parentheses_count("(()(()(", 3)
    assert_parentheses_count("))(((((", 3)
  end

  test "down 1" do
    assert_parentheses_count("())", -1)
    assert_parentheses_count("))(", -1)
  end

  test "down 3" do
    assert_parentheses_count(")))", -3)
    assert_parentheses_count(")())())", -3)
  end

  test "enters basement at 1" do
    assert_stop_negative(")", 1)
    assert_stop_negative("()())", 5)
  end

  defp assert_parentheses_count(input, expected) do
    assert Day1Year15.count_parentheses(input) == expected
  end

  defp assert_stop_negative(input, expected) do
    assert Day1Year15.stop_negative(input) == expected
  end
end
