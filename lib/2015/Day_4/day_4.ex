defmodule Day4Year15 do
  def main() do
    input = "iwrupvqb"
    find_zeros(input, 6)
  end

  def find_zeros(str, zeroes \\ 5) do
    {ans, hash} = parallel_solve(str, zeroes)
    IO.write(hash)
    ans
  end

  defp parallel_solve(str, zeroes) do
    Enum.reduce_while(0..10_000_000, nil, fn n, _ ->
      case check_hash(str, n, zeroes) do
        {:ok, hash} ->
          {:halt, {n, hash}}

        _ ->
          {:cont, nil}
      end
    end)
  end

  defp check_hash(str, number, zeroes) do
    input = str <> Integer.to_string(number)
    hash = :crypto.hash(:md5, input) |> Base.encode16()

    if hash |> String.starts_with?(String.duplicate("0", zeroes)) do
      {:ok, hash}
    else
      :error
    end
  end
end
