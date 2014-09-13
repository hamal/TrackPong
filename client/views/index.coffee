###
  Layout & rendering for index
###

### ROUTING ###
class @IndexController extends RouteController
  template: 'indexMain'
  fastRender: true
  waitOn: ->

  data: ->


console.log "Router: configured #{IndexController.name}"

### RENDERED ###

### EVENTS ###
Template.indexMain.events
  'click #play': ->
    # Create a new match
    # Redirect to playRoute with the match created

### HELPERS ###
