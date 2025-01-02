defmodule ElixirTestableHttpApiClientTest do
  use ExUnit.Case
  doctest ElixirTestableHttpApiClient

  test "greets the world" do
    assert ElixirTestableHttpApiClient.hello() == :world
  end
end
