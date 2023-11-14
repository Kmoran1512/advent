defmodule Day1Year15 do
  @spec main() :: number()
  def main() do
    input_path = Path.join(["lib", "2015", "Day_1", "input.txt"])
    input = File.read!(input_path)
    # count_parentheses(input)
    stop_negative(input)
  end

  @spec count_parentheses(binary()) :: number()
  def count_parentheses(peren_str) do
    peren_list = String.codepoints(peren_str)
    Enum.map(peren_list, &peren_convert/1) |> Enum.sum()
  end

  @spec stop_negative(binary()) :: non_neg_integer()
  def stop_negative(peren_str) do
    peren_list = String.codepoints(peren_str)
    Enum.map(peren_list, &peren_convert/1) |> find_negative()
  end

  defp peren_convert("("), do: 1
  defp peren_convert(")"), do: -1

  defp find_negative(list, acc \\ 0, i \\ 0)
  defp find_negative(_, -1, i), do: i

  defp find_negative([num | tail], acc, i) do
    find_negative(tail, acc + num, i + 1)
  end
end
