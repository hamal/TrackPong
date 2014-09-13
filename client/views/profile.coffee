###
  Layout & rendering for index
###

### ROUTING ###
class @ProfileController extends RouteController
  template: 'profileMain'
  fastRender: true
  waitOn: ->
    console.log @params.username
    Meteor.subscribe 'playerPub', @params.username
  data: ->
    player: Players.findOne username: @params.username


console.log "Router: configured #{ProfileController.name}"

### RENDERED ###

### EVENTS ###

### HELPERS ###
