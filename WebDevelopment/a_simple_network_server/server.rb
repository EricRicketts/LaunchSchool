require 'socket'
require 'pry-byebug'

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  request_lines = []
  single_line = ''
  loop do
    single_line = client.gets
    break request_lines.push(single_line) if single_line.match?(/(\A|^)\r\n(\z|$)/)
    request_lines.push(single_line)
  end
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  request_lines.each do |line|
    client.puts line
  end
  client.close
end
