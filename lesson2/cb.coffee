config    = require './config'
couchbase = require 'couchbase'
arg       = require('yargs')
  .demand(1)
  .argv

input     = arg._[0]
myCluster = new couchbase.Cluster "#{config.host}:#{config.port}"
myBucket  = myCluster.openBucket config.bucket

document =
  save: ->
    name: arg.n
    age: arg.a
  get: ->
    name: arg.name

switch input
  when 'save'
    document = document.save()
    myBucket.insert document.name, document, (err, res) ->
      if err then console.error "Insert to Database Faild!", err  else
        console.log "Saved: ", res
      process.exit(1)
  when 'get'
    document = document.get()
    myBucket.get document.name, (err, res) ->
      if err then console.error "Geting from Database Faild!", err  else
        console.log "Value: ", res.value
      process.exit(1)
  else
    console.log "The Command Only Accepts \"save\" or \"get\" Input Keywords!!!"
    process.exit(1)



