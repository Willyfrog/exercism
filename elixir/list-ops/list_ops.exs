defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn (_, acc)->acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn (item, acc)->[item|acc] end)
  end
                    
  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reverse(reduce(l, [], fn (item, acc) -> [f.(item)|acc] end))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reverse(reduce(l, [], _gen_filter(f)))
  end

  @doc """
  generate a function that applies the filter and concatenates if it's right
  """
  defp _gen_filter(fun) do
    fn (item, acc) -> if fun.(item) do 
                      [item|acc]
                      else
                        acc
                      end
    end
  end
  
  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end
  
  @spec append(list, list) :: list
  def append(a, []), do: a
  def append(a, b) do
      _append(reverse(a), b)
  end

  defp _append([], b), do: b
  defp _append([h|t], b), do: _append(t, [h|b])
  
  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(reduce(ll, [], &_concat/2))
  end

  defp _concat(h, acc) when is_list(h), do: _append(h, acc)
  defp _concat(h, acc), do: [h|acc]
end
