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
6. Execute get_list_at(nums, i).
7. Execute get Map all element by for.
8. Execute get Map all element by Enum.reduce().
2 th run.
1. Execute get List all element by for each.
2. Execute get List all element by for with Enum.at().
3. Execute get List all element by Enum.reduce() each.
4. Execute get List all element by Enum.reduce() with Enum.at().
5. Execute get List all element by recursive call.
6. Execute get_list_at(nums, i).
7. Execute get Map all element by for.
8. Execute get Map all element by Enum.reduce().
3 th run.
1. Execute get List all element by for each.
2. Execute get List all element by for with Enum.at().
3. Execute get List all element by Enum.reduce() each.
4. Execute get List all element by Enum.reduce() with Enum.at().
5. Execute get List all element by recursive call.
6. Execute get_list_at(nums, i).
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
Benchmarking map_each ...
Benchmarking map_witn_enum_at ...
Benchmarking recurse ...
Benchmarking reduce_each ...
Benchmarking reduce_with_enum_at ...

Name                          ips        average  deviation         median         99th %
recurse                  686.82 K        1.46 μs    ±13.07%        1.42 μs        1.58 μs
reduce_each              242.18 K        4.13 μs   ±341.17%        4.13 μs        4.46 μs
for                      102.52 K        9.75 μs    ±71.93%        9.63 μs       10.67 μs
map_each                  70.93 K       14.10 μs    ±50.02%       14.08 μs       14.38 μs
map_witn_enum_at          58.42 K       17.12 μs    ±24.17%          17 μs       19.46 μs
for_with_enum_at           1.39 K      720.94 μs     ±3.13%      718.88 μs      751.15 μs
reduce_with_enum_at        1.39 K      721.26 μs     ±1.42%      717.49 μs      754.01 μs
get_list_at                1.27 K      788.00 μs     ±1.02%      787.42 μs      821.05 μs

Comparison:
recurse                  686.82 K
reduce_each              242.18 K - 2.84x slower +2.67 μs
for                      102.52 K - 6.70x slower +8.30 μs
map_each                  70.93 K - 9.68x slower +12.64 μs
map_witn_enum_at          58.42 K - 11.76x slower +15.66 μs
for_with_enum_at           1.39 K - 495.16x slower +719.48 μs
reduce_with_enum_at        1.39 K - 495.38x slower +719.80 μs
get_list_at                1.27 K - 541.22x slower +786.55 μs

Memory usage statistics:

Name                   Memory usage
recurse                        0 KB
reduce_each                    0 KB - 1.00x memory usage +0 KB
for                        15.63 KB - ∞ x memory usage +15.63 KB
map_each                   0.102 KB - ∞ x memory usage +0.102 KB
map_witn_enum_at           15.73 KB - ∞ x memory usage +15.73 KB
for_with_enum_at           31.35 KB - ∞ x memory usage +31.35 KB
reduce_with_enum_at        15.73 KB - ∞ x memory usage +15.73 KB
get_list_at                15.73 KB - ∞ x memory usage +15.73 KB

**All measurements for memory usage were the same**
```
