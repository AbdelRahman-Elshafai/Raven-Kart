require 'resque/tasks'

task "resque:setup" => :environment do
  ENV['QUEUES'] = 'mailers,default'
end