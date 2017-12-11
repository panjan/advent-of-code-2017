defmodule Spiral do
  def solve(number) do
    odd_numbers = Stream.iterate(1, &(&1+1))
    |> Stream.filter(fn(x) -> rem(x, 2) == 1 end)
    |> Enum.take_while(fn(x) -> x*x < number end)
    last = Enum.at(odd_numbers, -1)
    distance_from_power = number - last*last
    center = round(last/2)
    distance_from_center = rem(distance_from_power, center)
    Enum.count(odd_numbers) + distance_from_center
  end
end

IO.puts("First part: #{Spiral.solve(277678)}")
IO.puts("Second part: http://oeis.org/A141481")
