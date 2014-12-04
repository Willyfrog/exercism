defmodule Teenager do

  def hey(input) do
    cond do
      is_silent?(input) -> "Fine. Be that way!"
      is_question?(input) -> "Sure."
      is_yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
  
  defp is_yelling?(input) do
    filtered = letters_only(input)
    not is_empty?(filtered) and (filtered == String.upcase(filtered))
  end

  defp ends_in_question_mark?(input) do
    String.ends_with(input, "?")
  end

  defp is_empty?(input), do: is_empty?(input, letters_and_numbers_only)
  
  defp is_empty?(input, filter_with) do
    String.length(filter_with.(input)) == 0
  end
  
  defp is_silent?(input) do
    is_empty?(input)
  end

  defp letters_only(original) do
    String.replace(original, ~r/[\W0-9\s]+/, "")
  end

  defp letters_and_numbers_only(original) do
    String.replace(original, ~r/[\W\s]+/, "")
  end
  
end
