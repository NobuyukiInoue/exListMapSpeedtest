defmodule Main do
  @moduledoc """
  Documentation for `Main`.
  """
  @spec main(_ :: [String.t]) :: :ok
  def main(args \\ []) do
    if Enum.count(args) < 1 do
        "Usage: main <element_size> [enable_Benchee] [enable_puts]\n" <>
        "\n" <>
        "Options:\n" <>
        "    enable_Benchee[true | false]: Use Benchee. (default: true)\n" <>
        "    enable_puts[true | false]: Enable List and Map all element IO.puts(). (default: false)\n" <>
        "\n" <>
        "Example)\n" <>
        "./main 10000 false\n" <>
        "./main 1000 false true\n" <>
        "./main 1000 true\n" |> IO.puts()
    else
      enable_puts =
        if Enum.count(args) > 2 do
          if String.upcase(Enum.at(args, 2)) == "TRUE" do
            true
          else
            false
          end
        else
          false
        end

      enable_Benchee =
      if Enum.count(args) > 1 do
        if String.upcase(Enum.at(args, 1)) == "TRUE" do
          true
        else
          false
        end
      else
        true
      end

      "enable_Bench = " <> to_string(enable_Benchee) |> IO.puts()
      "enable_puts = " <> to_string(enable_puts) |> IO.puts()

      res = Integer.parse(Enum.at(args, 0))
      case res do
          :error ->
            Enum.at(args, 0) <> " is not decimal." |> IO.puts()
          _ ->
            if enable_Benchee do
              Benchee_Solution.main(res |> elem(0), enable_puts)
            else
              Solution.main(res |> elem(0), enable_puts)
            end
      end
    end
  end
end
