defmodule QyVisualizer.Step do
  @moduledoc """
  介入 `Orchid.Step` 的相关模块。

  ## Examples

      defmodule StepWithPattern do
        use Orchid.Step
        use QyVisualizer.Step,
          tailwind: ~w(bg-green ...)

        ...
      end
  """

  defmacro __using__(opts) do
    quote do
      @visualizer_opts unquote(opts)

      # TODO: ensure fields
      def __visualizer_meta__ do
        %{
          title: Keyword.get(@visualizer_opts, :title),
          # icon: Keyword.get(@visualizer_opts, :icon, "cpu"),

          classes: normalize_classes(Keyword.get(@visualizer_opts, :tailwind, "")),

          layout: Keyword.get(@visualizer_opts, :layout, :auto),

          port_styles: Keyword.get(@visualizer_opts, :port_styles, %{})
        }
      end

      defp normalize_classes(classes) when is_list(classes), do: Enum.join(classes, " ")
      defp normalize_classes(classes) when is_binary(classes), do: classes
      defp normalize_classes(_), do: ""
    end
  end
end
