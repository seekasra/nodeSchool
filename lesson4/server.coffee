'use strict'

Hapi = require 'hapi'
server = new Hapi.Server()
say_hello = require 'node-say-hello'

server.connection port:3000

server.register [
  require 'vision'
  require 'inert'
  register: require 'lout'
], (err) ->
    console.error 'Failed to load plugin:', err if err?

server.method('say_hello', say_hello)
server.route [
  {
  method: 'GET'
  path: '/hello/{name}'
  handler: server.methods.say_hello
  config:
    description: "Say Hello!"
    notes: "This uses server methods!"
    tags: ["greeting"]
  }
]
server.start (err) ->
  console.error 'Server Failed', err if err?
  console.log "server started at: #{server.info.uri}"
