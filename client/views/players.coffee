###
  Layout & rendering for players
###

### ROUTING ###
class @PlayersController extends RouteController
  template: 'playersMain'
  fastRender: true
  # waitOn: ->
  # data: ->


console.log "Router: configured #{PlayersController.name}"

### RENDERED ###

### EVENTS ###
Template.playersMain.events
  'click #new-match': ->
    # Call server side method
    matchId = Meteor.call "newMatch", this.$("#playerOne"), this.$("#playerTwo")
    Router.go "matchRoute", _id: matchId

### HELPERS ###
Template.playersMain.helpers
  playerOne: ->
    Session.get "playerOne"
  playerTwo: ->
    Session.get "playerTwo"

Template.playersMain.settings = ->
  position: "bottom"
  limit: 5
  rules: [
    {
      collection: Players
      field: "username"
      matchAll: true
      template: Template.userPill
      # noMatchTemplate: ""
    }
    # {
    #   collection: Players
    #   field: "name"
    #   template: Template.userPill
    #   noMatchTemplate: ""
    # }
    # {
    #   collection: Players
    #   field: "surname"
    #   template: Template.userPill
    #   noMatchTemplate: ""
    # }
  ]
