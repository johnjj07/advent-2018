defmodule Advent.Day1 do

  def start(path \\ "resources/day1.txt") do
    IO.puts "Part 1 = #{part_1(path)}"
    IO.puts "Part 2 = #{part_2(path)}"
  end

  defp part_1(path) do
    load_stream(path)
    |> Stream.map(&(String.trim(&1)))
    |> Stream.map(&(String.to_integer(&1)))
    |> Enum.sum
  end

  defp part_2(path) do
    {:ok, lines} = File.read(path)
    lines |> String.split("\n", trim: true)
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.to_integer(&1)))
    |> calibrate(MapSet.new())
  end

  defp calibrate(list, set), do: calibrator(list, set, 0, list)

  defp calibrator(list, set, acc, original_list)
  defp calibrator([], set, acc, original_list) do
    calibrator(original_list, set, acc, original_list)
  end

  defp calibrator([head|tail], set, acc, original_list) do
    new_acc = acc + head
    cond do
      MapSet.member?(set, new_acc) -> 
        new_acc
      true ->
        new_set = MapSet.put(set, new_acc)
        calibrator(tail, new_set, new_acc, original_list)
    end
  end

  defp load_stream(path) do
    File.stream!(path)
  end

end
