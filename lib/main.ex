defmodule Main do
  @moduledoc """
  Documentation for `Main`.
  """
  @spec main(_ :: [String.t]) :: :ok
  def main(args \\ []) do
    if Enum.count(args) < 1 do
        "Usage) ./main <element_size> [enable_puts]\n" <>
        "\n" <>
        "Example)\n" <>
        "./main 10000 true\n" <>
        "./main 10000\n" |> IO.puts()
    else
      enable_puts =
        if Enum.count(args) > 1 do
          if String.upcase(Enum.at(args, 1)) == "TRUE" do
            true
          else
            false
          end
        else
          false
        end
      "enable_puts = " <> to_string(enable_puts) |> IO.puts()

      res = Integer.parse(Enum.at(args, 0))
      case res do
          :error ->
            Enum.at(args, 0) <> " is not decimal." |> IO.puts()
          _ ->
            Solution.main(res |> elem(0), enable_puts)
      end
    end
  end
end
