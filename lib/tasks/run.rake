task :run do
  exec("rails s & rake resque:scheduler & rake resque:work")
end