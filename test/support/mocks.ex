# Τhis configures Mox to use the MockGithubApi module as the API implementation in tests.
Mox.defmock(MockGithubApi, for: ElixirTestableHttpApiClient.GithubApi)
