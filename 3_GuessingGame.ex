defmodule GuessingGame do
  @moduledoc """
  guess between a low number and a high > guess middle number
  tell user computer guess
  "yes" > game is over
  "hot" > hot(low, high)
  "cold" > cold(low, high)
  anything else > tell user enter a valid response
  """
  def guess(l, h) when l > h, do: guess(h, l)

  def guess(low, high) do
    answer = IO.gets("Your guess is: #{middle(low, high)}\n")

    case String.trim(answer) do
      "hot" ->
        hot(low, high)

      "cold" ->
        cold(low, high)

      "yes" ->
        "I'm smarter than you thought. (0-0)"

      _ ->
        IO.puts(~s{Type "hot", "cold" or "yes".})
        guess(low, high)
    end
  end

  def middle(low, high) do
    div(low + high, 2)
  end

  def hot(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def cold(low, high) do
    new_high = min(high, mid(low, high) - 1)
    guess(low, new_high)
  end
end
