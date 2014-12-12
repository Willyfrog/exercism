defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> to_list
    |> list_counter
  end

  @doc """
Process the string to a list of words, accepting - and unicode
"""
  defp to_list(input) do
    String.split(input, ~r/[^\p{L}\p{N}\-]+/u, trim: true)
  end

defp list_counter(word_list) do
  Enum.reduce(word_list, %{},
    fn (elem, acc) -> Map.update(acc, elem, 1, &(&1 + 1)) end)
  end

end
