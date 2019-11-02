defmodule Advent.Day2Test do
  use ExUnit.Case

  alias Advent.Day2

  test "example use case" do
    test_list = [
      "abcdef",
      "bababc",
      "abbcde",
      "abcccd",
      "aabcdd",
      "abcdee",
      "ababab"
    ]
    assert Day2.check(test_list) == 12
  end
end
