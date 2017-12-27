defmodule Maze do
  def solve_part_1(maze) do
    step(maze, 0, 0, &(&1 + 1))
  end

  def solve_part_2(maze) do
    step(maze, 0, 0, &(if &1 > 2, do: &1 - 1, else: &1 + 1))
  end

  def step(maze, index, steps, _) when index not in 0..map_size(maze)-1, do: steps
  def step(maze, index, steps, modify_offset) do
    offset = maze[index]
    new_offset = modify_offset.(offset)
    new_maze = maze |> Map.put(index, new_offset)
    step(new_maze, index + offset, steps + 1, modify_offset)
  end

  def parse_input do
    File.read!("day_05/input.txt")
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
    # convert to map for faster random access
    |> Enum.with_index(0)
    |> Enum.map(fn {offset,index} -> {index,offset} end)
    |> Map.new
  end
end

maze = Maze.parse_input
IO.puts("First part:")
IO.inspect(Maze.solve_part_1(maze))
IO.puts("Second part:")
IO.inspect(Maze.solve_part_2(maze))
