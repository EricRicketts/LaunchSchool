require 'pry-byebug'
require 'socket'

def display_die_rolls(client, params)
  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do |n|
    str = "roll number #{n + 1}: " + (rand(sides) + 1).to_s
    client.puts str
  end
end

def display_parse(client, http_method, path, params)
  client.puts http_method
  client.puts path
  client.puts params
end

def parse_request(request)
  http_method = request.match(/[[:alpha:]]+(?=\s+\/)/)[0]
  path = request.match(/\//)[0]
  params = request.match(/(?<=\?).*(?=\s+H)/)[0].scan(/[[:alnum:]]+/).each_slice(2).map(&:itself).to_h
  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  client.puts request_line

  display_parse(client, http_method, path, params)
  display_die_rolls(client, params)

  client.close
end
