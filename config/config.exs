import Config

config :logger, :console,
  format: "[$level] $metadata\n",
  metadata: [:module]

import_config "#{config_env()}.exs"
