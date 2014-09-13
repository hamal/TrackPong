###
  Layout & rendering for leader
###

### ROUTING ###
class @LeaderController extends RouteController
  template: 'leaderMain'
  fastRender: true
  waitOn: ->
    Meteor.subscribe 'playersPub'
  data: ->
    players: Players.find({}, sort: score: -1)

console.log "Router: configured #{LeaderController.name}"


### RENDERED ###

### EVENTS ###

### HELPERS ###
