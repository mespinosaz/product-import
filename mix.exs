defmodule Import.MixProject do
  use Mix.Project

  def project do
    [
      app: :import,
      version: "0.1.0",
      elixir: "~> 1.8",
      escript: [main_module: Import],  # <- add this line
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [applications: [:logger, :yamerl]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yamerl, github: "yakaz/yamerl"},
      {:poison, "~> 3.1"}
    ]
  end
end
