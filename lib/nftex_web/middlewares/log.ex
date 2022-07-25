defmodule NftexWeb.Middlewares.Log do
  require Logger

  @behaviour Absinthe.Middleware

  @filter_string "[FILTERED]"
  @replacements [
    {~r/hash: "\w*"/, "hash: #{@filter_string}"},
    {~r/id: "\w*"/, "id: #{@filter_string}"}
  ]

  def call(resolution, _) do
    resolution
    |> log_message()
    |> filter_into()
    |> Logger.debug()

    resolution
  end

  def log_message(%Absinthe.Resolution{value: value}), do: "Resolution value #{inspect(value)}"

  def filter_into(log) do
    Enum.reduce(@replacements, log, fn {regex, replacement}, log ->
      String.replace(log, regex, replacement)
    end)
  end
end
