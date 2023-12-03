defmodule Solution do

  @spec get_list_all(nums :: [integer], nums_map :: %{}, enable_puts :: boolean) :: %{
          for_with_enum_at: float(),
          get_list_at: float(),
          map_each: float(),
          map_witn_enum_at: float(),
          recurse: float(),
          reduce_each: float(),
          reduce_with_enum_at: float()
        }
  def get_list_all(nums, nums_map, enable_puts) do
    res = %{}

    "1. Execute get List all element by for with Enum.at()." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_for_with_enum_at(nums)
      else
        MyFuncs.get_for_with_enum_at(nums)
      end
    end)
    res = Map.put(res, :for_with_enum_at, exectime)

    "2. Execute get List all element by Enum.reduce() each." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_Enum_reduce_each(nums)
      else
        MyFuncs.get_Enum_reduce_each(nums)
      end
    end)
    res = Map.put(res, :reduce_each, exectime)

    "3. Execute get List all element by Enum.reduce() with Enum.at()." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_Enum_reduce_with_enum_at(nums)
      else
        MyFuncs.get_Enum_reduce_with_enum_at(nums)
      end
    end)
    res = Map.put(res, :reduce_with_enum_at, exectime)

    "4. Execute get List all element by recursive call." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_recurse(0, nums)
      else
        MyFuncs.get_recurse(0, nums)
      end
    end)
    res = Map.put(res, :recurse, exectime)

    "5. Execute get_list_at(nums, i)." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_list_at_all(nums)
      else
        MyFuncs.get_list_at_all(nums)
      end
    end)
    res = Map.put(res, :get_list_at, exectime)

    "6. Execute get Map all element by for." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_map_witn_enum_at(nums_map)
      else
        MyFuncs.get_map_witn_enum_at(nums_map)
      end
    end)
    res = Map.put(res, :map_witn_enum_at, exectime)

    "7. Execute get Map all element by Enum.reduce()." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      if enable_puts do
        MyFuncs_with_puts.get_map_each(nums_map)
      else
        MyFuncs.get_map_each(nums_map)
      end
    end)
    Map.put(res, :map_each, exectime)

  end

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

    # output Map nums_map.
    arr_str_nums_map = Enum.reduce(0..arr_size-1, [], fn i, res ->
      res ++ [Integer.to_string(i) <> ": " <>  Integer.to_string(Map.get(nums_map, i))]
    end)
    "nums_map = %{" <> Enum.join(arr_str_nums_map, ", ") <> "}" |> IO.puts()

    # Execute some Functions.
    loop_count = 2
    result_times = for i <- 0..loop_count do
      Integer.to_string(i + 1) <> " th run." |> IO.puts()
      get_list_all(nums, nums_map, enable_puts)
    end

    # Output results.
    for i <- 0..loop_count do
      "##-------------------------------------------##" |> IO.puts()
      "## " <> Integer.to_string(i + 1) <> " th results." |> IO.puts()
      "##-------------------------------------------##" |> IO.puts()
      res = Enum.at(result_times, i)
      "1. for with Enum.at()    time : " <> Float.to_string(Float.round(Map.get(res, :for_with_enum_at), 3)) <> " [s]" |> IO.puts()
      "2. reduce each           time : " <> Float.to_string(Float.round(Map.get(res, :reduce_each), 3)) <> " [s]" |> IO.puts()
      "3. reduce with Enum.at() time : " <> Float.to_string(Float.round(Map.get(res, :reduce_with_enum_at), 3)) <> " [s]" |> IO.puts()
      "4. recurse (head)        time : " <> Float.to_string(Float.round(Map.get(res, :recurse), 3)) <> " [s]" |> IO.puts()
      "5. get_list_at()         time : " <> Float.to_string(Float.round(Map.get(res, :get_list_at), 3)) <> " [s]" |> IO.puts()
      "\nList to Map transration time : " <> Float.to_string(Float.round(exectime, 3)) <> " [s]" |> IO.puts()
      "6. Map by for            time : " <> Float.to_string(Float.round(Map.get(res, :map_witn_enum_at), 3)) <> " [s]" |> IO.puts()
      "7. Map by Enum.reduce()  time : " <> Float.to_string(Float.round(Map.get(res, :map_each), 3)) <> " [s]" |> IO.puts()
      IO.puts("")
    end
    :ok
  end
end
