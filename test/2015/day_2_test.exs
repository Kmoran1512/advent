defmodule Day2Year15Test do
  use ExUnit.Case
  doctest Day2Year15

  test "paper balanced box size" do
    box_size = "2x3x4"
    assert Day2Year15.sum_paper(box_size) == 58
  end

  test "paper two one sizes" do
    box_size = "1x1x10"
    assert Day2Year15.sum_paper(box_size) == 43
  end

  test "paper sums string array" do
    boxes = "23x21x1\r\n22x2x15\r\n27x8x13"
    assert Day2Year15.sum_paper(boxes) == 3359
  end

  test "ribbon balanced box size" do
    box_size = "2x3x4"
    assert Day2Year15.sum_ribbon(box_size) == 34
  end

  test "ribbon two one sizes" do
    box_size = "1x1x10"
    assert Day2Year15.sum_ribbon(box_size) == 14
  end
end
