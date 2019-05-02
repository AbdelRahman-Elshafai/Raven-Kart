require 'resque/tasks'
require 'resque/scheduler/tasks'


task "resque:setup" => :environment do
  ENV['QUEUES'] = 'mailers,default'
end