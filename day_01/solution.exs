defmodule Captcha do
  def solve(list, rotation) do
    {first_half, second_half} = Enum.split(list, rotation)
    rotated_list = second_half ++ first_half
    [list, rotated_list]
    |> Enum.zip
    |> Enum.filter(fn({x, y}) -> x == y end)
    |> Enum.map(fn({x, _}) -> x end)
    |> Enum.sum
  end

  def parse_input do
    {:ok, input} = File.read("day_01/input.txt")
    input
    |> String.trim()
    |> String.graphemes()
    |> Enum.map(&String.to_integer(&1))
  end
end

numbers = Captcha.parse_input()
first_part = Captcha.solve(numbers, 1)
IO.puts("First part: #{first_part}")

half = div(length(numbers), 2)
second_part = Captcha.solve(numbers, half)
IO.puts("Second part: #{second_part}")
