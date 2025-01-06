defmodule ElixirTestableHttpApiClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_testable_http_api_client,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirTestableHttpApiClient.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.4.8"},
      {:knigge, "~> 1.4"},

      # dev
      {:credo, "~> 1.7.4", only: [:dev, :test], runtime: false},

      # test
      {:mox, "~> 1.1", only: [:test]}
    ]
  end

  defp elixirc_paths(:test), do: ["test/support", "lib"]
  defp elixirc_paths(_), do: ["lib"]
end
