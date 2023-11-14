defmodule Day4Year15Test do
  use ExUnit.Case
  doctest Day4Year15

  # TODO-KM: Nil test

  test "abc" do
    assert Day4Year15.find_zeros("abcdef", 5) == 609043
  end

  test "pqr" do
    assert Day4Year15.find_zeros("pqrstuv", 5) == 1048970
  end
end
