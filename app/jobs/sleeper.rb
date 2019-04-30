class Sleeper
  @queue = :sleep
  def self.perform
    puts "Sleep...>> #{Time.now}"
  end
end