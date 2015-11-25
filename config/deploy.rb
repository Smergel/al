set :application, "albumExchange"
set :repo_url, "git@github.com/Smergel.albumExchange.git"
set :linked_dirs, %w(
  bin log vendor/bundle public/system
  tmp/pids tmp/cache tmp/sockets
)
set :puma_bind, "tcp://0.0.0.0:8080"