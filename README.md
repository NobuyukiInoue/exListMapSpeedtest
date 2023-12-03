# exListMapSpeedtest Main

Elixir Speedtest List and Map.

## Elixir Enum.at()がどれだけ遅いか。そしてMap

https://qiita.com/gx3n-inue/private/6f04bbc260c70c5730a2

## Require.

- Elixir 1.15.6
- Mix 1.15.6

## How to Build.

```
$ mix escript.build
```

## Execute example.

```
$ ./main 1000 true
...
...

$ ./main 100000
enable_puts = false
arr_size = 10
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
