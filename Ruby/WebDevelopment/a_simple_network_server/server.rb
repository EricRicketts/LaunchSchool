require 'socket'
require 'pry-byebug'

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  request_lines = []
  single_line = ''

  loop do
    single_line = client.gets.chomp
    break if single_line.empty? || single_line.nil?
    request_lines.push(single_line)
    puts single_line
  end

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  request_lines.each do |line|
    client.puts line
  end

  client.close
end
