# server basics

  `socket` library
    TCPServer class
      methods:
        `.accept` - creates a new socket object and a new addrinfo object, waits for connection?
        
    Socket class
      methods:
        `.gets` - read line from socket
        `.close` - closes connection

    `WEBrick` gem
      - web server gem
      - working with it can be difficult
      - use the `rack` library to make it easier
        rack is a generic interface to developers connect to web servers
        works with other servers besides WEBrick

    API - a collection of programs that allows a program to access other components of an OS

# application servers

  - Web servers
    receive client http requests
  - Application servers
    interface with web server to deconstruct http into application-friendly info
    run a ruby program with that info
    return to web server in an http-friendly way
  - Rack
    it is an specification (architecture?)
    makes the API between webserver and framwork consistent
    it feeds to the framework the `env` hash with the request info
    it needs returned to it an array of:
      1) status message (responds to `to_i`)
      2) headers (hash string k/v pairs)
      3) body (html)
    need a rackup file (config.ru) any name will work but config is standard
      THE RACK APP WE USE IN RU MUST BE A RUBY OBJECT THAT RESPONDS TO `call(env)`
        this must return the same 3 things shown above
      rack file should have a comment, require relative, and `run` Class.new

    bundle exec rackup config.ru -p ####

# View Templates

  - View templates
    code related to what we want to display
    allows us to do pre-processing and output html

  - ERB (embedded ruby)
    popular ruby templating library
    mixes ruby into html
    steps to use:
      1) require 'erb'
      2) create a template object with a string agrument, formatted correctly
        <%= %>
          evaluate ruby code and include return value in HTML
        <% %>
          evalutes but does not include in HTML. could be used for method definition
      3) invoke instance method `.result`

# Sinatra

  - Sinatra is a rack-based web development framework
    it makes a lot of the tedious parts of web development easier
    at it's core, it's some ruby code connecting to a TCP server, handling requests, and sending back HTTP compliant messages
    
# Creating a project

  1) Gemfile with dependencies
  2) config.ru with  run Class.new in it
  3) program rb file
  4) dependent rb files
  5) erb files for html boilerplate
