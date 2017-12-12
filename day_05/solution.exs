defmodule Maze do
  def solve_part_1(maze) do
    maze
  end

  def parse_input do
    File.read!("day_05/input.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn({i,_}) -> i end)
  end
end

maze = Maze.parse_input
IO.puts("First part:")
IO.inspect(Maze.solve_part_1(maze))
