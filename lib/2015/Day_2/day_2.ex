defmodule Day2Year15 do
  def main() do
    input_path = Path.join(["lib", "2015", "Day_2", "input.txt"])
    input = File.read!(input_path)

    # sum_paper(input)
    sum_ribbon(input)
  end

  def sum_paper(inputs) do
    paper_size = fn dims ->
      get_surface_area(dims) +
        get_smallest_surface_area(dims)
    end

    parse_boxes(inputs)
    |> Enum.map(paper_size)
    |> Enum.sum()
  end

  def sum_ribbon(inputs) do
    ribbon_length = fn dims ->
      get_smallest_wrapping_length(dims) +
        get_volume(dims)
    end

    parse_boxes(inputs)
    |> Enum.map(ribbon_length)
    |> Enum.sum()
  end

  defp parse_boxes(inputs) do
    inputs
    |> String.split(~r/\r?\n/, trim: true)
    |> Enum.map(&parse_dimension/1)
  end

  defp parse_dimension(dim_str) do
    dim_str
    |> String.split("x")
    |> Enum.map(&String.to_integer/1)
  end

  defp get_surface_area([h, w, l]) do
    2 * (l * w + w * h + h * l)
  end

  defp get_smallest_surface_area(dims) do
    dims |> least_two() |> Enum.reduce(fn x, acc -> x * acc end)
  end

  defp get_smallest_wrapping_length(dims) do
    2 * (dims |> least_two() |> Enum.sum())
  end

  defp get_volume(dims), do: dims |> Enum.reduce(fn x, acc -> x * acc end)
  defp least_two(dims), do: dims |> Enum.sort() |> Enum.take(2)
end
