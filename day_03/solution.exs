defmodule Spiral do
  def solve(number, size, {x,y}) do
    cond do
      number == 1
        -> abs(x) + abs(y)
      x == size && y == -size
        -> solve(number - 1, size + 1, {x+1,y})
      y == -size
        -> solve(number - 1, size, {x+1,y})
      x == -size
        -> solve(number - 1, size, {x,y-1})
      y == size
        -> solve(number - 1, size, {x-1,y})
      x == size
        -> solve(number - 1, size, {x,y+1})
    end
  end
end
IO.puts("First part:")
IO.inspect(Spiral.solve(277678, 0, {0, 0}))
IO.puts("Second part:")
