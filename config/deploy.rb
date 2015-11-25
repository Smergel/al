set :application, "albumExchange"
set :repo_url, "https://github.com/Smergel/albumExchange"
set :linked_dirs, %w(
  bin log vendor/bundle public/system
  tmp/pids tmp/cache tmp/sockets
)
set :puma_bind, "tcp://0.0.0.0:8080"