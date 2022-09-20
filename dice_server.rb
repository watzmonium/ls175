require 'socket'

def parse_request(request)
  method, query, params = request.split(' ')
  path, query = query.split('?')
  query = hash_queries(query.split('&'))
  [method, path, query, params]
end

def hash_queries(query_arr)
  query_arr.each_with_object({}) do |q, q_strs|
    q_arr = q.split('=') 
    q_strs[q_arr.first] = q_arr.last
  end
end

def roll_dice(client, q_hsh)
  q_hsh['rolls'].to_i.times do 
    client.puts "<p>#{rand(q_hsh['sides'].to_i) + 1}</p>"
  end
end

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  method, path, query, protocol = parse_request(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<!DOCTYPE html>"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<h1>Rolls!</h1>"

  roll_dice(client, query)
  client.puts "</body>"
  client.puts "</html>"

  client.close
end