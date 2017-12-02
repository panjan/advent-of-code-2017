{:ok, input} = File.read("day_01/input.txt")

defmodule Captcha do
  def solve(_prev, []), do: 0
  def solve(prev, [head|tail]) do
    if prev == head, do: prev + solve(head, tail), else: solve(head, tail)
  end
end

input_ints = input
             |> String.trim()
             |> String.graphemes()
             |> Enum.map(&String.to_integer(&1))

circular_list = input_ints ++ [List.first(input_ints)]

IO.puts(Captcha.solve(0, circular_list))
