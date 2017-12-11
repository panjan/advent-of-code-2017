defmodule Passphrases do
  def solve_part_1(passphrases) do
    passphrases
    |> Enum.filter(fn(pass) -> duplicate_free?(pass) end)
    |> Enum.count
  end

  def solve_part_2(passphrases) do
  end

  def duplicate_free?(words) do
    duplicates = words -- Enum.uniq(words)
    Enum.count(duplicates) == 0
  end

  def parse_input do
    File.read!("day_04/input.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "\s"))
  end
end

passphrases = Passphrases.parse_input
IO.puts("First part: #{Passphrases.solve_part_1(passphrases)}")
IO.puts("Second part: #{Passphrases.solve_part_2(passphrases)}")
