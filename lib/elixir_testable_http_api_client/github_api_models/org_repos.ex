defmodule ElixirTestableHttpApiClient.GithubApiModels.OrgRepos do
  @moduledoc """
  Parse Github Org Repos response into OrgRepos struct
  """

  # We're defining a repo here as a simple map with just one key. Should we need more,
  # it might make more sense to create a dedicated struct for it
  @type repo :: %{name: String.t()}
  @type t :: %__MODULE__{repos: [repo()]}

  defstruct repos: []

  def new(json_response) do
    repos = Enum.map(json_response, fn repo -> %{name: Map.get(repo, "name")} end)

    %__MODULE__{repos: repos}
  end
end
