defmodule Spiral do
  def solve(number, size, {x,y}) do
    cond do
      number == 1
        -> abs(x) + abs(y)
      x == size - 1 && y == 1 - size
        -> solve(number - 1, size + 1, {x+1,y})
      x == size - 1 && y == size - 1
        -> solve(number - 1, size, {x-1,y})
      x == 1 - size && y == size - 1
        -> solve(number - 1, size, {x,y-1})
      x == 1 - size && y == 1 - size
        -> solve(number - 1, size, {x+1,y})
      y == 1 - size
        -> solve(number - 1, size, {x+1,y})
      x == 1 - size
        -> solve(number - 1, size, {x,y-1})
      y == size - 1
        -> solve(number - 1, size, {x-1,y})
      x == size - 1
        -> solve(number - 1, size, {x,y+1})
    end
  end
end
IO.puts("First part:")
IO.inspect(Spiral.solve(277678, 1, {0, 0}))
IO.puts("Second part:")
