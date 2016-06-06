Hapi = require 'hapi'
People = require("./people")
arg = require('yargs')
  .demand(1)
  .argv

input = arg._[0]

document =
  save: ->
    name: arg.n
    age: arg.a
  get: ->
    name: arg.name

switch input
  when 'save'
    people = new People document.save()
    people.create(true)
      .then (result) ->
        if result.isBoom then console.error 'Couldn\'t Save The Document', result.output.payload else
          console.log
            name: result.name
            age: result.age
          process.exit 1
  when 'get'
    people = People.get document.get().name
      .then (result) ->
        if result.isBoom then console.log 'Couldn\'t Fetch The Document', result else
          console.log result.doc
          process.exit 1
  else
    console.log "The Command Only Accepts \"save\" or \"get\" Input Keywords!!!"
    process.exit 1
