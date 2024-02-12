defmodule GithubApiModels.OrgReposTest do
  use ExUnit.Case, async: true

  alias ElixirTestableHttpApiClient.GithubApiModels.OrgRepos

  @valid_json_response [
    %{"name" => "repo A", "some_ignored_key" => "foo"},
    %{"name" => "repo B", "another_ignored_key" => "bar"}
  ]

  describe "new/1" do
    test "can parse a valid json response" do
      assert %{
               repos: [
                 %{name: "repo A"},
                 %{name: "repo B"}
               ]
             } = OrgRepos.new(@valid_json_response)
    end
  end
end
