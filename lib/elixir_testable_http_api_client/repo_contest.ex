defmodule ElixirTestableHttpApiClient.RepoContest do
  @moduledoc """
  Functions for facilitating a Repo Contest (TM)
  """

  alias ElixirTestableHttpApiClient.GithubApi

  @type winner :: {String.t(), pos_integer()}

  @doc """
  Declares a winner (or a draw) between 2 competing organizations
  in the Repo Contest. The winner is declared based on the number of
  public repos. If the counts are the same it's a draw.
  """
  @spec head_to_head(String.t(), String.t()) :: winner() | :draw
  def head_to_head(org_1, org_2) do
    count_1 = org_1 |> GithubApi.get_repos_for_org() |> count_repos()
    count_2 = org_2 |> GithubApi.get_repos_for_org() |> count_repos()

    cond do
      count_1 > count_2 -> {org_1, count_1}
      count_1 < count_2 -> {org_2, count_2}
      true -> :draw
    end
  end

  defp count_repos({:error, _reason}), do: 0
  defp count_repos({:ok, %{repos: repos}}), do: length(repos)
end
