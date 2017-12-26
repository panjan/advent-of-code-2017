defmodule Maze do
  def solve_part_1(maze) do
    step(maze, 0, 0)
  end

  def step(maze, index, steps) do
    if Enum.member?(0..Enum.count(maze) - 1, index) do
      value = Enum.at(maze, index)
      new_maze = maze |> List.replace_at(index, value + 1)
      step(new_maze, index + value, steps + 1)
    else
      steps
    end
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
