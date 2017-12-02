
defmodule Captcha do
  def solve(list, rotation) do
    {first_half, second_half} = Enum.split(list, rotation)
    rotated_list = second_half ++ first_half
    [list, rotated_list]
    |> Enum.zip
    |> Enum.filter(fn({x,y}) -> x == y end)
    |> Enum.map(fn({x,_}) -> x end)
    |> Enum.sum
  end
  def first_part(list) do
    Captcha.solve(list, 1)
  end
  def second_part(list) do
    Captcha.solve(list, div(length(list),2))
  end
  def parse_input do
    {:ok, input} = File.read("day_01/input.txt")
    input
    |> String.trim()
    |> String.graphemes()
    |> Enum.map(&String.to_integer(&1))
  end
end

input = Captcha.parse_input()
IO.puts("First part: #{Captcha.first_part(input)}")
IO.puts("Second part: #{Captcha.second_part(input)}")
