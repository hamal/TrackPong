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
