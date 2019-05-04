task :stop do
  # pids_array = Array.new
  file = "pid.txt"
  File.readlines(file).each do |line|
    command = " kill -9  #{line}"
    system command
  end
  exec("rake sunspot:solr:stop")
end