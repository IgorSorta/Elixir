defmodule DollarsToCents do
  @moduledoc """
  Program to convert dollar to cents with the cents of:

    Quarters (25 ¢)
    Dimes (10 ¢)
    Nickels (5 ¢)
    Pennies (1 ¢)

  """
  # No input provided.
  def convert(), do: IO.puts("Nothing to convert.")

  # If input is integer or float (2.50, 250).
  def convert(ammount) when is_integer(ammount) or is_float(ammount) do
    if Kernel.is_float(ammount) do
      {:f, ammount}
      |> round_value()
      |> split_by_coins(ammount)
    else
      {:i, ammount}
      |> round_value()
      |> split_by_coins(ammount)
    end
  end

  # If input is string ("2.50", "2.50$", "250")
  def convert(ammount) do
    # In input string, "$" and dot sign replaced by "", then converted that to the integer.
    sanitized = String.replace(ammount, ~r/(\$)/i, "")

    to_number(sanitized)
    |> round_value()
    |> split_by_coins(sanitized)
  end

  # Split money by coins and output.
  defp split_by_coins(money, sanitized) do
    IO.puts("Dollars $$$: #{sanitized}")

    IO.puts("Quarters (25 ¢): #{Kernel.floor(money / 25)}")
    balance = Integer.mod(money, 25)

    IO.puts("Dimes (10 ¢): #{Kernel.floor(balance / 10)}")
    balance1 = Integer.mod(balance, 10)

    IO.puts("Nickels (5 ¢): #{Kernel.floor(balance1 / 5)}")
    balance2 = Integer.mod(balance1, 5)

    IO.puts("Pennies (1 ¢): #{Kernel.floor(balance2 / 1)}")
  end

  # Round the money value.
  defp round_value(value) do
    case value do
      {:i, int} ->
        Kernel.round(int * 100)

      {:f, float} ->
        Kernel.trunc(Float.round(float * 100))
    end
  end

  # Converted input string to integer or float number.
  defp to_number(value) do
    if String.match?(value, ~r/(\d\.\d)/i) do
      {:f, String.to_float(value)}
    else
      {:i, String.to_integer(value)}
    end
  end
end
