defmodule Solution do

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
    loop_count = 2
    result_times = for i <- 1..loop_count do
      Integer.to_string(i) <> " th run." |> IO.puts()
      if enable_puts do
        MyFuncs_with_puts.get_list_all(nums, nums_map)
      else
        MyFuncs.get_list_all(nums, nums_map)
      end
    end

    # Output results.
    Enum.reduce(result_times, 1, fn res, i ->
      "##-------------------------------------------##" |> IO.puts()
      "## " <> Integer.to_string(i) <> " th results." |> IO.puts()
      "##-------------------------------------------##" |> IO.puts()
      "1. for each               time : " <> Float.to_string(Float.round(Map.get(res, :for), 3)) <> " [s]" |> IO.puts()
      "2. for with Enum.at()     time : " <> Float.to_string(Float.round(Map.get(res, :for_with_enum_at), 3)) <> " [s]" |> IO.puts()
      "3. reduce each            time : " <> Float.to_string(Float.round(Map.get(res, :reduce_each), 3)) <> " [s]" |> IO.puts()
      "4. reduce with Enum.at()  time : " <> Float.to_string(Float.round(Map.get(res, :reduce_with_enum_at), 3)) <> " [s]" |> IO.puts()
      "5. recurse (head)         time : " <> Float.to_string(Float.round(Map.get(res, :recurse), 3)) <> " [s]" |> IO.puts()
      "6. get_list_at()          time : " <> Float.to_string(Float.round(Map.get(res, :get_list_at), 3)) <> " [s]" |> IO.puts()
      "\nList to Map transration time : " <> Float.to_string(Float.round(exectime, 3)) <> " [s]" |> IO.puts()
      "7. Map by for             time : " <> Float.to_string(Float.round(Map.get(res, :map_witn_enum_at), 3)) <> " [s]" |> IO.puts()
      "8. Map by Enum.reduce()   time : " <> Float.to_string(Float.round(Map.get(res, :map_each), 3)) <> " [s]" |> IO.puts()
      IO.puts("")
      i + 1
    end)
    :ok
  end
end
