defmodule BinToDec do
  @moduledoc """
  Bin2Dec allows the user to enter up to 8 binary digits, 0's and 1's, in any sequence and then displays its decimal equivalent.
  """

  def parse(), do: IO.puts("Nothing to convert. Please enter a binary sequence.")

  def parse(bin) do
    str = Integer.to_string(bin)

    array =
      String.split(str, "", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)

    convert(array, Enum.count(array) - 1, [])
    |> Enum.reduce(&(&1 + &2))
  end

  @doc """
  convert func. takes array of binary digits, lengths of the array - 1(it's represent increasing power to raise 2), and empty array as accumulator.
  """
  defp convert([], _, accum) do
    accum
  end

  defp convert([head | tail], p, accum) do
    convert(tail, p - 1, [DoPower.do_pow(p) * head] ++ accum)
  end
end

defmodule DoPower do
  @doc """
  do_pow:
    In the binary system, each digit represents an increasing power of 2, with the rightmost digit representing 2 in pow 0, the next representing 2 in pow 1, then 2 in pow 2, and so on.
  """
  def do_pow(power) do
    pow(2, power, 1)
  end

  def pow(_, 0, acc), do: acc

  def pow(k, n, acc) when n > 0 do
    pow(k, n - 1, acc * k)
  end
end
