# exListMapSpeedtest Main

Elixir Speedtest List and Map.

## Elixir Enum.at()がどれだけ遅いか。そしてMap

https://qiita.com/gx3n-inue/private/6f04bbc260c70c5730a2

## Require.

- Elixir 1.15.6
- Mix 1.15.6

## How to Build.

```
$ mix deps.get
$ mix compile
$ mix escript.build
```

## Execute example.

```
$ ./main
Usage: main <element_size> [enable_Benchee] [enable_puts]

Options:
    enable_Benchee[true | false]: Use Benchee. (default: true)
    enable_puts[true | false]: Enable List and Map all element IO.puts(). (default: false)

Example)
./main 100000 false
./main 1000 false true
./main 1000
```

```
$ ./main 100000 false
enable_puts = false
arr_size = 100000
nums = [6, 7, 2, 8, 4, 4, 4, 0, 0, .....
....
....

List to Map finished.
List to Map transration time : 0.025 [s]
Wait ... create output string from Map.
nums_map = %{0: 6, 1: 7, 2: 2, 3: 8, 4: 4, 5: 4, 6: 4, 7: 0, 8: 0, .....
....
....

1 th run.
1. Execute get List all element by for each.
2. Execute get List all element by for with Enum.at().
3. Execute get List all element by Enum.reduce() each.
4. Execute get List all element by Enum.reduce() with Enum.at().
5. Execute get List all element by recursive call.
6. Execute get_list_at_all(nums).
7. Execute get Map all element by for.
8. Execute get Map all element by Enum.reduce().
2 th run.
1. Execute get List all element by for each.
2. Execute get List all element by for with Enum.at().
3. Execute get List all element by Enum.reduce() each.
4. Execute get List all element by Enum.reduce() with Enum.at().
5. Execute get List all element by recursive call.
6. Execute get_list_at_all(nums).
7. Execute get Map all element by for.
8. Execute get Map all element by Enum.reduce().
3 th run.
1. Execute get List all element by for each.
2. Execute get List all element by for with Enum.at().
3. Execute get List all element by Enum.reduce() each.
4. Execute get List all element by Enum.reduce() with Enum.at().
5. Execute get List all element by recursive call.
6. Execute get_list_at_all(nums).
7. Execute get Map all element by for.
8. Execute get Map all element by Enum.reduce().
##-------------------------------------------##
## 1 th results.
##-------------------------------------------##
1. for each               time : 0.002 [s]
2. for with Enum.at()     time : 7.388 [s]
3. reduce each            time : 0.0 [s]
4. reduce with Enum.at()  time : 7.332 [s]
5. recurse (head)         time : 0.0 [s]
6. get_list_at()          time : 8.467 [s]

List to Map transration time : 0.025 [s]
7. Map by for             time : 0.006 [s]
8. Map by Enum.reduce()   time : 0.002 [s]

##-------------------------------------------##
## 2 th results.
##-------------------------------------------##
1. for each               time : 0.001 [s]
2. for with Enum.at()     time : 7.38 [s]
3. reduce each            time : 0.0 [s]
4. reduce with Enum.at()  time : 7.305 [s]
5. recurse (head)         time : 0.0 [s]
6. get_list_at()          time : 8.64 [s]

List to Map transration time : 0.025 [s]
7. Map by for             time : 0.004 [s]
8. Map by Enum.reduce()   time : 0.002 [s]

##-------------------------------------------##
## 3 th results.
##-------------------------------------------##
1. for each               time : 0.002 [s]
2. for with Enum.at()     time : 7.293 [s]
3. reduce each            time : 0.0 [s]
4. reduce with Enum.at()  time : 7.377 [s]
5. recurse (head)         time : 0.0 [s]
6. get_list_at()          time : 8.593 [s]

List to Map transration time : 0.025 [s]
7. Map by for             time : 0.004 [s]
8. Map by Enum.reduce()   time : 0.002 [s]

```

```
$ ./main 1000 true
nable_Bench = true
enable_puts = false
arr_size = 1000
nums = [5, 5, 0, 4, 2, 8, 0, ...
List to Map finished.
List to Map transration time : 0.0 [s]
Wait ... create output string from Map.
nums_map = %{0: 5, 1: 5, 2: 0, 3: 4, 4: 2, 5: 8, 6: 0, ...
...
...
Could not check if protocols are consolidated. Running as escript? Defaulting to they are consolidated.
Operating System: macOS
CPU Information: Apple M1
Number of Available Cores: 8
Available memory: 8 GB
Elixir 1.15.6
Erlang 26.0.2

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 1.87 min

Benchmarking for ...
Benchmarking for_with_enum_at ...
Benchmarking get_list_at ...
Benchmarking get_map_for ...
Benchmarking get_map_reduce ...
Benchmarking recurse ...
Benchmarking reduce_each ...
Benchmarking reduce_with_enum_at ...

Name                          ips        average  deviation         median         99th %
recurse                  690.30 K        1.45 μs    ±14.41%        1.42 μs        1.58 μs
reduce_each              248.42 K        4.03 μs   ±117.24%        4.13 μs        4.46 μs
for                       98.74 K       10.13 μs   ±176.76%        9.88 μs       15.67 μs
get_map_reduce            71.88 K       13.91 μs    ±48.74%       13.83 μs       14.33 μs
get_map_for               59.58 K       16.78 μs    ±25.06%       16.58 μs       18.96 μs
reduce_with_enum_at        1.40 K      716.71 μs     ±0.97%      716.52 μs      748.85 μs
for_with_enum_at           1.38 K      723.18 μs     ±3.29%      719.75 μs      777.64 μs
get_list_at                1.26 K      793.45 μs     ±1.48%      791.50 μs      844.25 μs

Comparison:
recurse                  690.30 K
reduce_each              248.42 K - 2.78x slower +2.58 μs
for                       98.74 K - 6.99x slower +8.68 μs
get_map_reduce            71.88 K - 9.60x slower +12.46 μs
get_map_for               59.58 K - 11.59x slower +15.34 μs
reduce_with_enum_at        1.40 K - 494.74x slower +715.26 μs
for_with_enum_at           1.38 K - 499.21x slower +721.73 μs
get_list_at                1.26 K - 547.72x slower +792.00 μs

Memory usage statistics:

Name                   Memory usage
recurse                        0 KB
reduce_each                    0 KB - 1.00x memory usage +0 KB
for                        15.63 KB - ∞ x memory usage +15.63 KB
get_map_reduce             0.102 KB - ∞ x memory usage +0.102 KB
get_map_for                15.73 KB - ∞ x memory usage +15.73 KB
reduce_with_enum_at        15.73 KB - ∞ x memory usage +15.73 KB
for_with_enum_at           31.35 KB - ∞ x memory usage +31.35 KB
get_list_at                15.73 KB - ∞ x memory usage +15.73 KB

**All measurements for memory usage were the same**
```
