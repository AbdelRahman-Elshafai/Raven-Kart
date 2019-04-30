require 'resque/tasks'

task "resque:setup" => :environment do
  Resque.enqueue(Sleeper)

  ENV['QUEUES'] = 'sleep'

  Resque.redis = 'localhost:6379'

end