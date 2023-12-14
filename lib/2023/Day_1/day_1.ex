defmodule Day1Year23 do
  @number_words %{
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }
  @number_captures Enum.join(Map.keys(@number_words), "|")

  def main do
    input_path = Path.join(["lib", "2023", "Day_1", "input.txt"])
    input = File.read!(input_path)

    parseInput(input)
  end

  def parseInput(input) do
    input
    |> String.split(~r/\r?\n/, trim: true)
    |> Enum.map(&Day1Year23.mapLineToNum/1)
    |> Enum.sum()
  end

  def mapLineToNum(line) do
    numbers = Regex.scan(~r/(?=([0-9]|#{Enum.join(Map.keys(@number_words), "|")}))/, line)

    [hd(numbers), List.last(numbers)]
    |> Enum.map(&to_integer/1)
    |> Enum.join("")
    |> String.to_integer()
  end

  def to_integer([_ | [str]]) when is_binary(str) do
    case Integer.parse(str) do
      {value, _} -> value
      :error -> word_to_number(str)
    end
  end

  defp word_to_number(word) do
    @number_words[word]
  end
end
