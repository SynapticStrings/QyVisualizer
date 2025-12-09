defmodule QyVisualizer.Step do
  @moduledoc """
  介入 `QyCore.Step` 的相关模块。

  ## Examples

      defmodule StepWithPattern do
        use QyCore.Step
        use QyVisualizer.Step,
          tailwind: ~w(bg-green ...)

        ...
      end
  """

  defmacro __using__(_opts) do
    quote do
      # ...
    end
  end
end
