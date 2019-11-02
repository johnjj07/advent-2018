defmodule Advent.Day2 do

  alias Advent.Frequency

  def start(path \\ "../../resources/day2.txt") do
    result = File.stream!(path)
    |> check()
    IO.puts "Result is #{result}"
  end

  def check(boxes) do
    {x, y} = Stream.map(boxes, fn x -> checksum(x) end)
    |> Enum.to_list()
    |> Enum.reduce(
      {0, 0}, 
      fn {two, three}, {acc_two, acc_three} -> {acc_two + two, acc_three + three} end
    )
    x * y
  end

  @spec checksum(binary) :: {integer, integer}
  def checksum(box_id) do
    String.codepoints(box_id)
    |> Enum.sort()
    |> Frequency.calculate(%Frequency{}, {0, 0})
  end

end
