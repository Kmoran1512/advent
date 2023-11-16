defmodule Day6Year15 do
  require IEx

  def main do
    input_path = Path.join(["lib", "2015", "Day_6", "input.txt"])
    input = File.read!(input_path)

    apply_lights(input)
  end

  def apply_lights(input) do
    inputs =
      input |> String.split(~r/\r?\n/, trim: true) |> Enum.map(&format_input/1)

    mat = get_matrix()

    inputs
    |> Enum.reduce(mat, fn instruction, acc ->
      {cmd, s, e} = instruction

      apply_cmd(cmd, get_coords(s, e), acc)
    end)
    |> Map.values()
    |> Enum.count(& &1)
  end

  def get_coords({x0, y0}, {x1, y1}) do
    for x <- x0..x1, y <- y0..y1, do: {x, y}
  end

  def apply_cmd(cmd, coordinates, grid) do
    put_fn =
      case cmd do
        :on -> fn _ -> true end
        :off -> fn _ -> false end
        :toggle -> fn x -> not x end
      end

    Enum.reduce(coordinates, grid, fn k, a ->
      Map.put(a, k, put_fn.(Map.get(a, k)))
    end)
  end

  def get_matrix(z \\ 999) do
    for(x <- 0..z, y <- 0..z, do: {x, y})
    |> Enum.reduce(%{}, fn key, a -> Map.put(a, key, false) end)
  end

  def format_input(input) do
    instruction =
      case input do
        "turn on" <> _ -> :on
        "turn off" <> _ -> :off
        "toggle" <> _ -> :toggle
      end

    [x0, y0, x1, y1] =
      Regex.scan(~r/[0-9]+/, input)
      |> Enum.map(fn [r | _] -> String.to_integer(r) end)

    {instruction, {x0, y0}, {x1, y1}}
  end
end
