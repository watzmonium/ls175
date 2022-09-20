require 'socket'

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept
  p client
  while request_line = client.gets do
    puts request_line
  end

  client.puts "HTTP/1.1 200 OK\r\n\r\n"
  client.close
end