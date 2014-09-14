###
  Layout & rendering for match
###

### ROUTING ###
class @MatchController extends RouteController
  template: 'matchMain'
  fastRender: true
  waitOn: ->
    Meteor.subscribe 'matchPub', @params._id
  data: ->
    match: Matches.findOne(_id: @params._id)


console.log "Router: configured #{MatchController.name}"

### RENDERED ###

### EVENTS ###


### HELPERS ###
getData = (rawData) ->
  pieces = rawData.split(" ")
  return null  if not pieces or pieces.length <= 3
  new
  kind: pieces[0]
  timestamp: pieces[1]
  value: pieces[2]