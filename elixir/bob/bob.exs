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
    has_letters?(input) and input == String.upcase(input)
  end

  defp is_question? (input) do
    ends_in_question_mark?(input)
  end
  
  defp ends_in_question_mark?(input) do
    String.ends_with?(input, "?")
  end

  defp is_silent?(input) do
    not has_letters?(input) and not has_numbers?(input)
  end
  
  defp has_letters?(input) do
    String.match?(input, ~r/\p{L}/)
  end

  defp has_numbers?(input) do
    String.match?(input, ~r/\p{N}/)
  end
  
end
