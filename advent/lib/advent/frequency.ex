defmodule Advent.Frequency do

  alias Advent.Frequency

  defstruct(
    code_point: nil,
    count: 1
  )

  def calculate(_, _, state = {1, 1}), do: state

  def calculate([], %Frequency{code_point: _, count: 2}, {_, three}), do: {1, three} 

  def calculate([], %Frequency{code_point: _, count: 3}, {two, _}), do: {two, 1}

  def calculate([], _, state), do: state 

  def calculate([head | tail], %Frequency{code_point: head, count: count}, state) do
    calculate(tail, %Frequency{code_point: head, count: count + 1}, state)
  end

  def calculate([head | tail], %Frequency{code_point: point, count: 2}, state = {_, three}) do
    calculate(tail, %Frequency{code_point: head, count: 1}, {1, three})
  end

  def calculate([head | tail], %Frequency{code_point: point, count: 3}, state = {two, _}) do
    calculate(tail, %Frequency{code_point: head, count: 1}, {two, 1})
  end

  def calculate([head | tail], %Frequency{code_point: point, count: count}, state) do
    calculate(tail, %Frequency{code_point: head, count: 1}, state)
  end
end
