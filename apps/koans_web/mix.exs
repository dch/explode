defmodule KoansWeb.Mixfile do
  use Mix.Project

  def project do
    [
      app: :koans_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {KoansWeb.Application, []},
      extra_applications: [:logger, :runtime_tools, :oauth2, :ueberauth_github]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.3"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:koans, in_umbrella: true},
      {:cowboy, "~> 1.0"},
      {:guardian, "~> 1.1"},
      {:ueberauth, "~> 0.5.0"},
      {:ueberauth_identity, "~> 0.2.3"},
      {:ueberauth_google, "~> 0.7.0"},
      {:ueberauth_github, "~> 0.7.0"},
      #{:ueberauth_gitlab_strategy, "~> 0.2."}
      #Just to start
      {:comeonin, "~> 4.1"},
      {:argon2_elixir, "~> 1.3"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    []
  end
end
