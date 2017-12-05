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

  def solve(lines) do
    lines
    |> Enum.map(&Enum.min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)
    |> Enum.sum
  end
end

first_part = Checksum.parse_input |> Checksum.solve
IO.puts("First part:")
IO.inspect(first_part)
