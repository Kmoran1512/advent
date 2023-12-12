defmodule Day7Year15 do
  import Bitwise

  def main do
    input_path = Path.join(["lib", "2015", "Day_6", "input.txt"])
    input = File.read!(input_path)

    attach_wires(input, :a)
  end

  def attach_wires(input, target_wire) do
    inputs =
      input |> String.split(~r/\r?\n/, trim: true) |> Enum.map(&format_input/1)
  end

  def format_input(input) do
    cond do
      match?(~r/[0-9]+\s->\s[a-z]/, input) ->
        input_cmd(input)

      match?(~r/[a-z]\s[A-Z]+\s[a-z]\s->\s[a-z]/, input) ->
        mod_cmd(input)

      match?(~r/LSHIFT|RSHIFT/, input) ->
        nil
    end
  end

  def input_cmd(input) do
    {:in, Regex.run(~r/[0-9]+/, input), Regex.run(~r/[a-z]/, input)}
  end

  def mod_cmd(input) do
    m = hd(Regex.run(~r/[A-Z]+/, input))

    cmd =
      case m do
        "AND" -> fn x, y -> x &&& y end
        "OR" -> fn x, y -> x ||| y end
      end

    [a, b, c] = Regex.scan(~r/[a-z]/, input)
    {:mod, a, b, cmd, c}
  end

  ~c"""
    123 -> x
  456 -> y
  x AND y -> d
  x OR y -> e
  x LSHIFT 2 -> f
  y RSHIFT 2 -> g
  NOT x -> h
  NOT y -> i
  """
end
