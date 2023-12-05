defmodule MyFuncs_with_puts do
  @spec get_list_all(nums :: [integer], nums_map :: %{integer: integer}) :: %{
    for: float(),
    for_with_enum_at: float(),
    get_list_at: float(),
    map_each: float(),
    map_witn_enum_at: float(),
    recurse: float(),
    reduce_each: float(),
    reduce_with_enum_at: float()
  }
  def get_list_all(nums, nums_map) do
    res = %{}

    "1. Execute get List all element by for each." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_for(nums)
    end)
    res = Map.put(res, :for, exectime)


    "2. Execute get List all element by for with Enum.at()." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_for_with_enum_at(nums)
    end)
    res = Map.put(res, :for_with_enum_at, exectime)

    "3. Execute get List all element by Enum.reduce() each." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_Enum_reduce_each(nums)
    end)
    res = Map.put(res, :reduce_each, exectime)

    "4. Execute get List all element by Enum.reduce() with Enum.at()." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_Enum_reduce_with_enum_at(nums)
    end)
    res = Map.put(res, :reduce_with_enum_at, exectime)

    "5. Execute get List all element by recursive call." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_recurse_main(nums)
    end)
    res = Map.put(res, :recurse, exectime)

    "6. Execute get_list_at_all(nums)." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_list_at_all(nums)
    end)
    res = Map.put(res, :get_list_at, exectime)

    "7. Execute get Map all element by for." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_map_for(nums_map)
    end)
    res = Map.put(res, :map_witn_enum_at, exectime)

    "8. Execute get Map all element by Enum.reduce()." |> IO.puts()
    exectime = Benchmark.measure(fn ->
      get_map_reduce(nums_map)
    end)
    Map.put(res, :map_each, exectime)
  end

  @spec get_for(nums :: [integer]) :: [integer]
  def get_for(nums) do
    for num <- nums do
      "num = " <> Integer.to_string(num) |> IO.puts()
    end
  end

  @spec get_for_with_enum_at(nums :: [integer]) :: [integer]
  def get_for_with_enum_at(nums) do
    for i <- 0..Enum.count(nums) - 1 do
      num = Enum.at(nums, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end
  end

  @spec get_Enum_reduce_each(nums :: [integer]) :: integer
  def get_Enum_reduce_each(nums) do
    Enum.reduce(nums, 0, fn num, i ->
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      i + 1
    end)
  end

  @spec get_Enum_reduce_with_enum_at(nums :: [integer]) :: integer
  def get_Enum_reduce_with_enum_at(nums) do
    Enum.reduce(0..Enum.count(nums) - 1, 0, fn i, _ ->
      num = Enum.at(nums, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end)
  end

  @spec get_recurse_main(nums :: [integer]) :: integer
  def get_recurse_main(nums) do
    get_recurse(0, nums)
  end

  @spec get_recurse(i :: integer, nums :: [integer]) :: integer
  def get_recurse(i, []) do
    i + 1
  end

  def get_recurse(i, [head | tail]) do
    _ = head
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(head) |> IO.puts()
    get_recurse(i + 1, tail)
  end

  @spec get_list_at_all(nums :: [integer]) :: [integer]
  def get_list_at_all(nums) do
    for i <- 0..Enum.count(nums) - 1 do
      num = get_list_at(nums, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end
  end

  @spec get_list_at(nums :: [integer], target_index :: integer) :: integer
  def get_list_at([head | _], target_index) when target_index == 0 do
    head
  end

  def get_list_at([_ | tail], target_index) do
    get_list_at(tail, target_index, 1)
  end

  @spec get_list_at(nums :: [integer], target_index :: integer, i :: integer) :: integer
  def get_list_at([head | _], target_index, i) when i == target_index do
    head
  end

  def get_list_at([_ | tail], target_index, i) do
    get_list_at(tail, target_index, i + 1)
  end

  @spec get_map_for(nums_map :: %{}) :: [integer]
  def get_map_for(nums_map) do
    for i <- 0..map_size(nums_map)-1 do
      num = Map.get(nums_map, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end
  end

  @spec get_map_reduce(nums_map :: %{}) :: integer
  def get_map_reduce(nums_map) do
    Enum.reduce(0..map_size(nums_map)-1, 0, fn i, _ ->
      num = Map.get(nums_map, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end)
  end
end
