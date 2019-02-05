require 'socket'
require 'pry-byebug'

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  arr = Array.new
  request_line = ''
  rq = ''
  counter = 0
  puts "Begin loop and request output"
  puts

  loop do
    request_line = client.gets
    rq = request_line.dup
    rq = rq.chomp
    puts(rq + ' line ' + counter.to_s)
    arr.push(rq)
    counter += 1
    break if request_line == "\r\n"
  end

  # binding.pry
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  arr.each.with_index { |line, idx| client.puts(line + ' line ' + idx.to_s) }
  puts "\n\n"
  client.close
end

=begin
Just really wnat to understand what is going on here.

So in line 4 we createa a TCP Server socket bound to "localhost"
port 3003.  As the video stated, the internals of TCP/IP is
not the focus in RB170.  However, based on my prior teaching
in RB170, servers wait for requests and then respond to requests.
In view of how servers work, then we have created our own
server at IP Address 127.0.0.1:3003.

Here is a question, is DNS still at work here, considering
localhost is my own computer?  If I understand from our prior
instruction, the ISP will take the domain name and send it out
to the DNS servers, the DNS servers will return the IP Address
to the ISP so that the browsers GET request is submitted to the
required IP address, which is actually a request to a server
which hosts that IP Address.

On line 6, the video stated a wait state is entered until
someone tries to request something from the server.  I say
"wait state" because when I noticed the code does not advance
until I actually hit return in the URL field of the browser.

Once a request is made, then this server will accept the request and
then it will open a connection to the client.  In the video
it says the code returns a "client object", which is actually
a TCPSocket object according to the documentation.  The video
says this "client object" enables us to interact with whatever
the remote system is.  Note it returns a TCPSocket object and
the TCPSocket class is the parent class to TCPServer.

On line 8, we are using #gets to grab just the first line of
the request.  In relating to my prior Launch School learning,
the request is


=end
