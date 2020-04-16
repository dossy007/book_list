app_path = File.expand_path('../../',__FILE__)
#/var/www/を指す

#アプリケーションサーバの性能を決定する
worker_processes 1

#/var/www/appにてunicornを動かす
working_derectory app_path

#pidの場所指定 rails sした時同様
pid "#{app_path}/tmp/pids/unicorn.pid"

#port
listen 3000
#unicorn.error.logの場所
stderr_path "#{app_path}/log/unicorn.stderr.log"

#通常log
stdout_path "#{app_path}/log/uniconrn.stdout.log"

#timeoutの上限時間
timeout 30

#以下応用

# 基本的には`true`を指定する。Unicornの再起動時にダウンタイムなしで再起動が行われる。
preload_app true
#効果なし？
# GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true


check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end