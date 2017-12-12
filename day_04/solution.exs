defmodule Passphrases do
  def solve_part_1(passphrases) do
    passphrases
    |> Enum.filter(fn(pass) -> duplicate_free?(pass) end)
    |> Enum.count
  end

  def solve_part_2(passphrases) do
    passphrases
    |> Enum.map(fn(pass) -> sort_chars(pass) end)
    |> Enum.filter(fn(pass) -> duplicate_free?(pass) end)
    |> Enum.count
  end

  def duplicate_free?(words) do
    duplicates = words -- Enum.uniq(words)
    Enum.empty?(duplicates)
  end

  def sort_chars(password) do
    password |> Enum.map(fn(word) -> Enum.sort(String.graphemes(word)) end)
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
