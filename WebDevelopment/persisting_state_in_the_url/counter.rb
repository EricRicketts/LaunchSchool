require 'pry-byebug'
require 'socket'

def parse_request(request_line)
  http_method = request_line.match(/[[:alpha:]]+(?=\s+\/)/)[0]
  path = request_line.match(/\//)[0]
  params = request_line.match(/(?<=\?).*(?=\s+H)/)[0].scan(/[\p{Alnum}\-]+/).each_slice(2).map(&:itself).to_h || {}

  [http_method, path, params]
end

def send_response(client, params)
  send_response_status_and_header(client)
  send_response_body(client, params)
end

def send_response_body(client, params)
  number = params["number"].to_i


  client.puts "<html>"
  client.puts "<body>"

  client.puts "<h3>Counter</h3>"
  client.puts "<p>The current number is #{number}</p>"

  client.puts "<p><a href=\"?number=#{number + 1}\">increment number by one</a></p>"
  client.puts "<p><a href=\"?number=#{number - 1}\">decrement number by one</a></p>"

  client.puts "</body>"
  client.puts "</html>"
end

def send_response_status_and_header(client)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  binding.pry
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  send_response(client, params)

  client.close
end
