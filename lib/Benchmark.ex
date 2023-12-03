defmodule Benchmark do

  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

  def measure2(function) do
    {time, res} = :timer.tc(function)
    {time |> Kernel./(1_000_000), res}
  end

end
