'use strict'

Hapi = require 'hapi'
server = new Hapi.Server()

server.connection port:3000

server.register [
  require 'vision'
  require 'inert'
  register: require 'lout'
], (err) ->
    console.error 'Failed to load plugin:', err if err?

sayhi = (request, reply) ->
  greeting =  "Hello #{request.params.name}!"
  reply greeting

server.method('sayhi', sayhi)
server.route [
  {
  method: 'GET'
  path: '/{name}'
  handler: (request, reply) ->
    reply "Hello #{request.params.name}!"
  config:
    description: "Say Hello!"
    tags: ["hello"]
  }
  {
  method: 'GET'
  path: '/hello/{name}'
  handler: server.methods.sayhi
  config:
    description: "Say Hello!"
    notes: "This uses server methods!"
    tags: ["greeting"]
  }
]
server.start (err) ->
  console.error 'Server Failed', err if err?
  console.log "server started at: #{server.info.uri}"
