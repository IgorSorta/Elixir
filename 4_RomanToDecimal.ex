defmodule RomanToDecimal do
  @moduledoc """
  Roman to Decimal numbers Converter

  See the below table the Symbol - Value pairs:

    I - 1
    V - 5
    X - 10
    L - 50
    C - 100
    D - 500
    M - 1000

  """
  def to_decimal(char) do
    char
    |> roman_1()
    |> roman_5()
    |> roman_10()
    |> roman_50()
    |> roman_100()
    |> roman_500()
    |> roman_1000()
    |> calculate()
  end

  defp roman_1(num), do: Regex.replace(~r/(I)/, num, "1 ")
  defp roman_5(num), do: Regex.replace(~r/(V)/, num, "5 ")
  defp roman_10(num), do: Regex.replace(~r/(X)/, num, "10 ")
  defp roman_50(num), do: Regex.replace(~r/(L)/, num, "50 ")
  defp roman_100(num), do: Regex.replace(~r/(C)/, num, "100 ")
  defp roman_500(num), do: Regex.replace(~r/(D)/, num, "500 ")
  defp roman_1000(num), do: Regex.replace(~r/(M)/, num, "1000 ")

  defp calculate(value) do
    String.split(value)
    |> Enum.map(fn elem -> String.to_integer(elem) end)
    |> Enum.reduce(fn elem, acc -> elem + acc end)
  end
end
