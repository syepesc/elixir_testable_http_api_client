# Elixir Testable HTTP API Client

The intent of this repo is to practice my Elixir knowledge by making use of the GitHub API.

Special thanks to the authors of the amazing doc [Creating testable HTTP API client code in Elixir](https://dev.betterdoc.org/elixir/http/mocks/opinion/2021/11/19/creating-testable-http-api-client-code-in-elixir.html).

**Concepts applied**:

- Elixir behaviors using [Knigge](https://hexdocs.pm/knigge/readme.html).
- HTTP requests using [Req](https://hexdocs.pm/req/readme.html).
- Elixir testing using [Mox](https://hexdocs.pm/mox/readme.html).

## What to expect when running the app?

This is an app that only work trough commands typed in the terminal after running it using `iex`. To have an idea of what the app does start reading `lib/elixir_testable_http_api_client/repo_contest.ex`.

## How to run the project?

- Install [mise](https://mise.jdx.dev/getting-started.html) (previously `rtx`) , `cd` into the project directory and run:

```bash
mise install
```

- `cd` into the project directory and run:

```bash
mix deps.get
```

- Compile and start the project by running:

```bash
iex -S mix
```

- Play around with the repo contest functionality by running:

```elixir
ElixirTestableHttpApiClient.GithubApi.get_repos_for_org("elixir-lang")
```

OR

```elixir
ElixirTestableHttpApiClient.RepoContest.head_to_head("org-1", "org-2")
```

> Remember to change `org-1` and `org-2` to the GitHub orgs you want to compare.

## How to run the test suite of the project?

- `cd` into the project directory and run:

```bash
mix test
```
