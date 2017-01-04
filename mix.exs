defmodule Exlist.Mixfile do
  use Mix.Project

  def project do
    [app: :exlist,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
   ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, github: "elixir-lang/ex_doc", override: true,only: :dev},
   {:earmark, "~> 1.0", only: :dev},
   {:dialyxir, "~> 0.3", only: [:dev]},

 ]
  end

  defp description do
    """
      The extended functions of the lists which are not available in the default 
      List Module and some basic mathematical operations on the list alog with some regular 
      functions
    """
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Ahamtech"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/blackode/exlist",
              "Docs" => "http://hexdocs.pm/exlist/"}
     ]
  end
end
