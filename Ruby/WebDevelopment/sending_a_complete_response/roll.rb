require 'pry-byebug'
require 'socket'

def compose_and_display_response(client, request_line, http_method, path, params)
  status_line_headers_and_blank_line(client)

  client.puts "<html>"
  client.puts "<body>"

  display_request_elements(client, request_line, http_method, path, params)
  display_roll_results(client, params)

  client.puts "</body>"
  client.puts "</html>"
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

def display_request_elements(client, request_line, http_method, path, params)
  client.puts "<h3>Request Data</h3>"
  client.puts "<dl>"
  client.puts "<dt>Request Line</dt>"
  client.puts "<dd>#{request_line}</dd>"
  client.puts "<dt>HTTP Method</dt>"
  client.puts "<dd>#{http_method}</dd>"
  client.puts "<dt>Path</dt>"
  client.puts "<dd>#{path}</dd>"
  client.puts "<dt>Parameters</dt>"
  client.puts "<dd>#{params}</dd>"
  client.puts "</dl>"
end

def display_roll_results(client, params)
  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  client.puts "<h3>Die Roll Results</h3>"
  client.puts "<p>The die has #{sides} sides</p>"
  client.puts "<p>#{rolls} rolls were requested</p>"

  client.puts "<ol>"
  rolls.times do
    roll = rand(sides) + 1
    client.puts "<li>die roll is #{roll}</li>"
  end
  client.puts "</ol>"
end

def status_line_headers_and_blank_line(client)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)
  compose_and_display_response(client, request_line, http_method, path, params)

  client.close
end
