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
  'click #new-match': (event, template) ->
    # Call server side method
    Meteor.call 'newMatch', $("#playerOne").val(), $("#playerTwo").val(), (error, matchId) ->
      console.log "Match created #{matchId}"
      Router.go "matchRoute", _id: matchId
  'click #new-user': (event, template) ->
    Meteor.call 'newPlayer', $("#username").val(), $("#name").val(), $("#surname").val(), $("#deviceId").val(), (error, playerId) ->
      console.log "Player created #{playerId}"



### HELPERS ###
Template.playersMain.players = ->
  Players.find().fetch().map((player) -> it.username)
