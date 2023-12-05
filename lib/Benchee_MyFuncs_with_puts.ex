defmodule Benchee_MyFuncs_with_puts do
  @spec get_list_all(nums :: [integer], nums_map :: %{integer: integer}, integer, integer, []) :: %{}
  def get_list_all(nums, nums_map, arg_time, arg_memory_time, arg_print) do
    Benchee.run(
      %{
        "for" => fn -> get_for(nums) end,
        "for_with_enum_at" => fn -> get_for_with_enum_at(nums) end,
        "reduce_each" => fn -> get_Enum_reduce_each(nums) end,
        "reduce_with_enum_at" => fn -> get_Enum_reduce_with_enum_at(nums) end,
        "recurse" => fn -> get_recurse_main(nums) end,
        "get_list_at" => fn -> get_list_at_all(nums) end,
        "map_witn_enum_at" => fn -> get_map_witn_enum_at(nums_map) end,
        "map_each" => fn -> get_map_each(nums_map) end
      },
      time: arg_time,
      memory_time: arg_memory_time,
      print: arg_print
    )
  end

  # 1. Execute get List all element by for each.
  @spec get_for(nums :: [integer]) :: [integer]
  def get_for(nums) do
    for num <- nums do
      "num = " <> Integer.to_string(num) |> IO.puts()
    end
  end

  # 2. Execute get List all element by for with Enum.at().
  @spec get_for_with_enum_at(nums :: [integer]) :: [integer]
  def get_for_with_enum_at(nums) do
    for i <- 0..Enum.count(nums) - 1 do
      num = Enum.at(nums, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end
  end

  # 3. Execute get List all element by Enum.reduce() each.
  @spec get_Enum_reduce_each(nums :: [integer]) :: integer
  def get_Enum_reduce_each(nums) do
    Enum.reduce(nums, 0, fn num, i ->
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      i + 1
    end)
  end

  # 4. Execute get List all element by Enum.reduce() with Enum.at().
  @spec get_Enum_reduce_with_enum_at(nums :: [integer]) :: integer
  def get_Enum_reduce_with_enum_at(nums) do
    Enum.reduce(0..Enum.count(nums) - 1, 0, fn i, _ ->
      num = Enum.at(nums, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end)
  end

  # 5. Execute get List all element by recursive call.
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

  # 6. Execute get_list_at(nums, i).
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

  # 7. Execute get Map all element by for.
  @spec get_map_witn_enum_at(nums_map :: %{}) :: [integer]
  def get_map_witn_enum_at(nums_map) do
    for i <- 0..map_size(nums_map)-1 do
      num = Map.get(nums_map, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end
  end

  # 8. Execute get Map all element by Enum.reduce().
  @spec get_map_each(nums_map :: %{}) :: integer
  def get_map_each(nums_map) do
    Enum.reduce(0..map_size(nums_map)-1, 0, fn i, _ ->
      num = Map.get(nums_map, i)
      "nums[" <> Integer.to_string(i) <> "] = " <> Integer.to_string(num) |> IO.puts()
      num
    end)
  end
end
