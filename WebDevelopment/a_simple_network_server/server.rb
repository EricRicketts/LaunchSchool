require 'socket'
require 'pry-byebug'

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"
  client.puts request_line
  client.close
end

=begin
Just really wnat to understand what is going on here.  I used
to be a hardware engineer before coming to Launch School, so maybe
I try to dig into the details too much.

Could anyone comment on my assumptions and answer my questions?

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
to the ISP so that the browsers GET request is submitted to an
actual IP address.

On line 6, the video stated a wait state is entered until
someone tries to request something from the server.  I say
"wait state" because when I noticed the code does not advance
until I actually hit return in the URL field of the browser.

Once a request is made, then this server will accept the request and
then it will open a connection to the client.  In the video
it says the code returns a "client object", which is actually
a TCPSocket object according to the documentation.  The video
says this "client object" enables us to interact with whatever
the remote system is.  If the server has to open a connection
with the client then how did the server receive the request in
the first place?  Some channel of communication had to be open.

On line 8, we are using #gets to grab just the first line of
the request.  This is where I get a bit confused.  So the client
formulated the request and sent it out, so client.gets grabs
the first line of the request.  Where is the text of the request
stored so #gets can retrieve it?

Are lines 11-13 "faking" a response from the server?  I can
see we have the required status field for a response, a response
header, and finally a response message body.  If this is true, how
does client.puts go about simulating a response from the server?
How does the browser know to display the "request_line" to the browser
window?

=end
