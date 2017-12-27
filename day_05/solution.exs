defmodule Maze do
  def solve_part_1(maze) do
    step(maze, 0, 0, fn(x) -> x + 1 end)
  end

  def solve_part_2(maze) do
    step(maze, 0, 0, fn(x) -> if x > 2, do: x - 1, else: x + 1 end)
  end

  def step(maze, index, steps, modify_offset) do
    if Enum.member?(0..Enum.count(maze) - 1, index) do
      value = Enum.at(maze, index)
      new_value = modify_offset.(value)
      new_maze = maze |> List.replace_at(index, new_value)
      step(new_maze, index + value, steps + 1, modify_offset)
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
IO.puts("Second part:")
IO.inspect(Maze.solve_part_2(maze))
