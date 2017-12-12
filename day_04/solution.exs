defmodule Passphrases do
  def solve_part_1(passphrases) do
    passphrases
    |> Enum.filter(&duplicate_free?/1)
    |> Enum.count
  end

  def solve_part_2(passphrases) do
    passphrases
    |> Enum.map(&sort_chars/1)
    |> Enum.filter(&duplicate_free?/1)
    |> Enum.count
  end

  def duplicate_free?(words) do
    duplicates = words -- Enum.uniq(words)
    Enum.empty?(duplicates)
  end

  def sort_chars(password) do
    password
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.sort/1)
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
