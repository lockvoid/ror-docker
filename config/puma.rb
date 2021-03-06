max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }

threads min_threads_count, max_threads_count
port ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
bind "unix://tmp/sockets/puma.sock"
pidfile "tmp/pids/puma.pid"
state_path "tmp/pids/puma.state"

plugin :tmp_restart
