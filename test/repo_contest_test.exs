defmodule ElixirTestableHttpApiClient.RepoContestTest do
  use ExUnit.Case, async: true

  import Mox

  alias ElixirTestableHttpApiClient.GithubApiModels.OrgRepos
  alias ElixirTestableHttpApiClient.RepoContest

  setup :verify_on_exit!

  describe "head_to_head/2" do
    test "when the first org has more repos than the other, the first org wins" do
      # Here though we'll be explicitly matching on the org_names
      # to make sure that we get the expected results. Also note a new parameter
      # with the value of '2' that we pass on to the expect/4 function,
      # which is the number of times we expect the :get_repos_for_org call to be made
      MockGithubApi
      |> expect(:get_repos_for_org, 2, fn
        "first-org" -> {:ok, %OrgRepos{repos: [%{name: "repoA"}, %{name: "repoB"}]}}
        "second-org" -> {:ok, %OrgRepos{repos: [%{name: "repoC"}]}}
      end)

      assert {"first-org", 2} == RepoContest.head_to_head("first-org", "second-org")
    end

    test "when the second org has more repos than the other, the second org wins" do
      MockGithubApi
      |> expect(:get_repos_for_org, 2, fn
        "first-org" -> {:ok, %OrgRepos{repos: [%{name: "repoA"}]}}
        "second-org" -> {:ok, %OrgRepos{repos: [%{name: "repoB"}, %{name: "repoC"}]}}
      end)

      assert {"second-org", 2} == RepoContest.head_to_head("first-org", "second-org")
    end

    test "when both orgs have the same number of repos it's a draw" do
      MockGithubApi
      |> expect(:get_repos_for_org, 2, fn
        "first-org" -> {:ok, %OrgRepos{repos: [%{name: "repoA"}]}}
        "second-org" -> {:ok, %OrgRepos{repos: [%{name: "repoB"}]}}
      end)

      assert :draw == RepoContest.head_to_head("first-org", "second-org")
    end
  end

  # test "when the request for the first org's repos fails it counts as 0 public repos" do
  # end
end
