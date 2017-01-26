# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :distributed_phoenix_test,
  namespace: SKT.DistributedPhoenixTest

# Configures the endpoint
config :distributed_phoenix_test, SKT.DistributedPhoenixTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MDOua/DwMXbOTPKiJWXVDPCDQt/nyHdb17vNYEH7Lq9shxCltOl5+9ByRiNPW2tl",
  render_errors: [view: SKT.DistributedPhoenixTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SKT.DistributedPhoenixTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  level: :debug,
  metadata: [:request_id]

config :peerage, via: Peerage.Via.Dns,
  dns_name: "distributed-phoenix-test.appuio-demo2495.svc.cluster.local",
  app_name: "distributed-phoenix-test"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
