require_relative './fake_io'

class CLI
  def self.run
    loop do
      input = $stdin.gets
      break if input.empty?
      $stdout.puts input
    end
  end
end
