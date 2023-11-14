defmodule Day3Year15 do
  def main() do
    input_path = Path.join(["lib", "2015", "Day_3", "input.txt"])
    input = File.read!(input_path)

    input
    |> unique_houses()
    |> IO.inspect()

    input
    |> robo_unique_houses()
    |> IO.inspect()
  end

  def unique_houses(input) do
    walk_path(String.graphemes(input), {0, 0}, MapSet.new([{0, 0}]))
    |> MapSet.size()
  end

  def robo_unique_houses(input) do
    {p1, p2} = String.graphemes(input) |> split_path()

    walk_path(p2, {0, 0}, walk_path(p1, {0, 0}, MapSet.new([{0, 0}])))
    |> MapSet.size()
  end

  defp walk_path([], _, visited), do: visited

  defp walk_path([head | tail], current_location, visited_houses) do
    {x, y} = current_location

    current_location =
      cond do
        head == "^" -> {x, y + 1}
        head == ">" -> {x + 1, y}
        head == "v" -> {x, y - 1}
        head == "<" -> {x - 1, y}
      end

    visited_houses = MapSet.put(visited_houses, current_location)
    walk_path(tail, current_location, visited_houses)
  end

  defp split_path(path), do: split_path(path, [], [])
  defp split_path([], p1, p2), do: {p1, p2}
  defp split_path([h], p1, p2), do: {p1 ++ [h], p2}

  defp split_path([h | [th | t]], p1, p2) do
    split_path(t, p1 ++ [h], p2 ++ [th])
  end
end
