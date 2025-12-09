defmodule QyVisualizer.Hook.FetchReport do
  @moduledoc """
  需要在 Execute 前。
  """

  @behaviour QyCore.Runner.Hook

  def call(context, next_fn) do
    # TODO: ...

    postlude(next_fn.(context))
  end

  defp postlude(res), do: res
end
