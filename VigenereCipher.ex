defmodule VigenereCipher do
  @moduledoc """

  """
  @base ?A
  @size ?Z - @base + 1

  def encrypt(text, key), do: crypt(text, key, 1)
  def decrypt(text, key), do: crypt(text, key, -1)

  defp crypt(text, key, dir) do
    text =
      String.upcase(text)
      |> String.replace(~r/[^A-Z]/, "")
      |> to_charlist()

    key_iterator =
      String.upcase(key)
      |> String.replace(~r/[^A-Z]/, "")
      |> to_charlist()
      |> Enum.map(fn c -> (c - @base) * dir end)
      |> Stream.cycle()

    Enum.zip(text, key_iterator)
    |> Enum.reduce('', fn {char, offset}, ciphertext ->
      [rem(char - @base + offset + @size, @size) + @base | ciphertext]
    end)
    |> Enum.reverse()
    |> List.to_string()
  end
end
