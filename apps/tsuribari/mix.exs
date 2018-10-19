defmodule Tsuribari.MixProject do
  use Mix.Project

  def project() do
    {_tag, description} = git_version()

    [
      app: :tsuribari,
      ## Commenting out essentially till I find a better git command
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      description: "tsuribari " <> description,
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application() do
    [
      extra_applications: [:logger],
      mod: {Tsuribari, []}
    ]
  end

  defp git_version() do
    # pulls version information from "nearest" git tag or sha hash-ish
    {hashish, 0} =
      System.cmd("git", ~w[describe --dirty --abbrev=7 --tags --always --first-parent])

    full_version = String.trim(hashish)

    tag_version =
      hashish
      |> String.split("-")
      |> List.first()
      |> String.replace_prefix("v", "")
      |> String.trim()

    tag_version =
      case Version.parse(tag_version) do
        :error -> "0.0.0+#{tag_version}"
        _ -> tag_version
      end

    {tag_version, full_version}
  end

  defp deps() do
    [
      {:bowie, "~> 0.0.0-alpha"},
      {:ibrowse, "~> 4.4.1", override: true},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev], runtime: false},
      {:recon, "~> 2.3.2"},
      {:icouch, "~> 0.5"},
      {:gen_rmq, "~> 1.0.0"},
      {:plug, "~> 1.6"},
      {:jason, "~> 1.1"},
      {:con_cache, "~> 0.13.0"},
      {:cowboy, "~> 1.0"}
    ]
  end
end
