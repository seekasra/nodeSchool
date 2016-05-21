Base = require('odme').CB
config = require './config'
db = new require('puffer')
  host: config.host
  name: config.bucket

module.exports =
  class People extends Base
    PREFIX: 'p'
    source: db
    props:
      name: yes
      age: yes
