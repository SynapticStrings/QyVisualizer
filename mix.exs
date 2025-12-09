defmodule QyVisualizer.MixProject do
  use Mix.Project

  def project do
    [
      app: :qy_visualizer,
      version: "0.0.1",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:telemetry, "~> 1.3"},
      {:qy_core, git: "https://github.com/SynapticStrings/QyCore.git", tag: "0.2.0"}
    ]
  end
end
