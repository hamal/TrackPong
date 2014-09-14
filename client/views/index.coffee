###
  Layout & rendering for index
###

### ROUTING ###
class @IndexController extends RouteController
  template: 'indexMain'
  fastRender: true
  # waitOn: ->
  # data: ->


console.log "Router: configured #{IndexController.name}"

### RENDERED ###

### EVENTS ###
Template.indexMain.events
  'click .button-match': (event, template) ->
    Router.go('playersRoute')
  'click .button-leaderboard': (event, template) ->
    Router.go('leaderRoute')
  'click .button-last-matches': (event, template) ->
    Router.go('matchListRoute')

### HELPERS ###
