alias QyCore.{Recipe, Step, Param}

defmodule StepA do
  use Step

  def run(_input, _step_options) do
    {:ok, Param.new(:step_a_out, nil)}
  end
end

defmodule StepB do
  use Step

  def run(_input, _step_options) do
    {:ok, [Param.new(:step_a_out, nil), Param.new(:step_b_out, nil)]}
  end
end

recipe = Recipe.new(
  [
    {StepA, :in, :mid_a},
    {StepA, :in, :mid_b},
    {StepA, {:mid_a, :mid_b}, :mid_c},
    {StepB, :mid_c, {:out1, :mid_d}},
    {StepB, :mid_d, {:out_2, :mid_e}},
    {fn _, _ -> {:ok, Param.new(:step_func_out, nil)} end, :mid_e, [:out_3]}
  ],
  name: :recipe
)

recipe
|> QyCore.run([%Param{name: :in, type: nil}])
|> IO.inspect(label: "[Result]")

recipe
|> QyVisualizer.Graph.build()
|> IO.inspect(label: "[Graph]")
