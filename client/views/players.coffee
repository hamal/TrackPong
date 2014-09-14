###
  Layout & rendering for players
###

### ROUTING ###
class @PlayersController extends RouteController
  template: 'playersMain'
  fastRender: true
  # waitOn: ->
  # data: ->
  # onBeforeAction: -

console.log "Router: configured #{PlayersController.name}"

### RENDERED ###


### EVENTS ###
Template.playersMain.events
  'click #new-match': ->
    # Call server side method
    Meteor.call 'newMatch', $("#playerOne").val(), $("#playerTwo").val(), (error, matchId) ->
      console.log "Match created #{matchId}"
      Router.go "matchRoute", _id: matchId

### HELPERS ###
Template.playersMain.players = ->
  Players.find().fetch().map((player) -> it.username)
