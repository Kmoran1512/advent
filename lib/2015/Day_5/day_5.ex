defmodule Day5Year15 do
  require IEx
  @illegal_phrases ~w(ab cd pq xy)
  @vowels ~w(a e i o u)

  def main() do
    input_path = Path.join(["lib", "2015", "Day_5", "input.txt"])
    input = File.read!(input_path)

    # count_nice_strings(input)
    Day5Year15_2.count_nice_strings(input)
  end

  def count_nice_strings(inputs) do
    inputs
    |> String.split(~r/\r?\n/, trim: true)
    |> Enum.count(&is_nice_str?/1)
  end

  def is_nice_str?(str) do
    contains_three_vowels?(str) and contains_double_letter?(str) and
      not contains_illegal_phrase?(str)
  end

  defp contains_three_vowels?(str) do
    str
    |> String.graphemes()
    |> Enum.count(&(&1 in @vowels)) >= 3
  end

  defp contains_double_letter?(str) do
    Regex.match?(~r/([a-zA-Z])\1/, str)
  end

  defp contains_illegal_phrase?(str) do
    Enum.any?(@illegal_phrases, &String.contains?(str, &1))
  end
end

defmodule Day5Year15_2 do
  def count_nice_strings(inputs) do
    inputs
    |> String.split(~r/\r?\n/, trim: true)
    |> Enum.count(&is_nice_str?/1)
  end

  @spec is_nice_str?(binary()) :: boolean()
  def is_nice_str?(str) do
    Regex.match?(~r/(..).*\1/, str) and Regex.match?(~r/([a-z]).\1/, str)
  end
end
