defmodule Advent do
  def switcher(year, day) do
    module_name = String.to_existing_atom("Elixir.Day#{day}Year#{year}")
    apply(module_name, :main, [])
  end
end
