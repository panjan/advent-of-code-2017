defmodule Passphrases do
  def solve do
    passphrases = parse_input()
    passphrases
    |> Enum.filter(fn(pass) -> valid?(pass) end)
    |> Enum.count
  end

  def valid?(words) do
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

IO.puts("First part: #{Passphrases.solve}")
