defmodule ExAwsChime.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_aws_chime,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_aws, "~> 2.1"},
      {:hackney, "~> 1.16"},
      {:jason, "~> 1.2"},
      {:uuid, "~> 1.1"},

      # Non-runtime deps
      {:configparser_ex, "~> 4.0", runtime: false},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      description: "Chime support library for ExAws",
      licenses: ["MIT"],
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Bernard Duggan"],
      links: %{github: "https://github.com/circles-learning-labs/ex_aws_chime"}
    ]
  end
end
