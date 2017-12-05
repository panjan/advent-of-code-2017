defmodule Checksum do
  def parse_input do
    File.read!("day_02/input.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&parse_line(&1))
  end

  def parse_line(line) do
    line
    |> String.split
    |> Enum.map(&String.to_integer/1)
  end

  def solve_part_1(lines) do
    lines
    |> Enum.map(&Enum.min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)
    |> Enum.sum
  end

  def solve_part_2(lines) do
    "foo"
  end
end

first_part = Checksum.parse_input |> Checksum.solve_part_1
IO.puts("First part:")
IO.inspect(first_part)
second_part = Checksum.parse_input |> Checksum.solve_part_2
IO.puts("Second part:")
IO.inspect(second_part)
