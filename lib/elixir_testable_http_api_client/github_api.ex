defmodule ElixirTestableHttpApiClient.GithubApi do
  @moduledoc """
  GitHub API Behaviour
  """

  # The otp_app config key is used to lookup the implementation dynamically.
  # By default the lookup happens during runtime for the TEST env build and at
  # compile time for all other builds
  use Knigge,
    otp_app: :elixir_testable_http_api_client,
    default: ElixirTestableHttpApiClient.GithubApiImpl

  alias ElixirTestableHttpApiClient.GithubApiModels.OrgRepos

  @type repo_response :: {:ok, OrgRepos.t()} | {:error, any()}

  @callback get_repos_for_org(org_name :: String.t()) :: repo_response()
end

defmodule ElixirTestableHttpApiClient.GithubApiImpl do
  @moduledoc """
  GitHub API Implementation
  """
  @behaviour ElixirTestableHttpApiClient.GithubApi

  alias ElixirTestableHttpApiClient.GithubApiModels.OrgRepos

  require Logger

  @github_base_url "https://api.github.com"

  def get_repos_for_org(org_name) do
    req =
      Req.new(
        base_url: @github_base_url,
        url: "/orgs/:org_name/repos",
        path_params: [org_name: org_name],
        params: [page: 1, per_page: 10]
      )

    case Req.get(req) do
      {:ok, %Req.Response{status: 200} = response} ->
        {:ok, OrgRepos.new(response.body)}

      {:error, reason} ->
        Logger.error("Error on request, #{inspect(reason)}")
        {:error, reason}
    end
  end
end
