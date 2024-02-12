defmodule GithubApiTest do
  use ExUnit.Case, async: true
  import Mox

  alias ElixirTestableHttpApiClient.GithubApi

  # This will ensure all expected mocks have been verified by the time each test is done.
  # See the Mox documentation https://hexdocs.pm/mox/Mox.html for nuances.
  setup :verify_on_exit!

  test "verify mock works" do
    MockGithubApi
    |> expect(:get_repos_for_org, fn _ -> "hello from mock" end)

    # make sure that the interception works as expected (sanity check)
    # If we got it wrong we will get back "hello", not "hello from mock"
    assert "hello from mock" == GithubApi.get_repos_for_org("some-org")
  end
end
