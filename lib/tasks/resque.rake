require 'resque/tasks'

task "resque:setup" => :environment do
  # Resque.enqueue(Sleeper)

  ENV['QUEUES'] = 'sleep'

end