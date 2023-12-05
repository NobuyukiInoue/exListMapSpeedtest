defmodule Benchee_Solution do

  @spec main(arr_size :: integer, enable_puts :: boolean) :: :ok
  def main(arr_size, enable_puts) do
    "arr_size = " <> Integer.to_string(arr_size) |> IO.puts()

    :rand.seed(:exs1024, :os.timestamp)

    # create List nums.
    nums = for _ <- 0..arr_size - 1 do (:rand.uniform 10) - 1 end

    # output List nums.
    "nums = [" <> Mylib.intList_to_string(nums) <> "]" |> IO.puts()

    # create Map from List nums.
    {exectime, nums_map} = Benchmark.measure_with_res(fn ->
      Enum.reduce(nums, {0, %{}}, fn num, {i, res} ->
        {i + 1, Map.put(res, i, num)}
      end) |> elem(1)
    end)
    "List to Map finished." |> IO.puts()
    "List to Map transration time : " <> Float.to_string(Float.round(exectime, 3)) <> " [s]" |> IO.puts()

    # output Map nums_map.
    "Wait ... create output string from Map." |> IO.puts()
    arr_str_nums_map = Enum.reduce(0..arr_size-1, [], fn i, res ->
      [Integer.to_string(i) <> ": " <>  Integer.to_string(Map.get(nums_map, i))] ++ res
    end) |> Enum.reverse()
    "nums_map = %{" <> Enum.join(arr_str_nums_map, ", ") <> "}" |> IO.puts()

    # Execute some Functions.
    if enable_puts do
      Benchee_MyFuncs_with_puts.get_list_all(nums, nums_map, 10, 2, [fast_warning: false])
    else
      Benchee_MyFuncs.get_list_all(nums, nums_map, 10, 2, [fast_warning: false])
    end

    :ok
  end
end
