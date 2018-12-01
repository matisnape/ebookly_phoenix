# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ebookly_phoenix,
  ecto_repos: [EbooklyPhoenix.Repo]

# Configures the endpoint
config :ebookly_phoenix, EbooklyPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8RhaLIsSgmBIxzJBwTKPD6RoON0Q5ipPflMCiKpQi24+A1JfOrDLGioF6/UXCv4a",
  render_errors: [view: EbooklyPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EbooklyPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
