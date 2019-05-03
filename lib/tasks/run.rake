task :run do
  exec("rails s & echo $! > pid.txt ;
        rake resque:scheduler & echo $! >> pid.txt ;
        rake resque:work & echo $! >> pid.txt")
end