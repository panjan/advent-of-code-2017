
defmodule Captcha do
  def solve(_prev, []), do: 0
  def solve(prev, [head|tail]) do
    if prev == head, do: prev + solve(head, tail), else: solve(head, tail)
  end
  def first_part do
    input_ints = parse_input()
    circular_list = input_ints ++ [List.first(input_ints)]
    Captcha.solve(0, circular_list)
  end
  def second_part do

  end
  def parse_input do
    {:ok, input} = File.read("day_01/input.txt")
    input
    |> String.trim()
    |> String.graphemes()
    |> Enum.map(&String.to_integer(&1))
  end
end

IO.puts(Captcha.first_part)
