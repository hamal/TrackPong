###
  Layout & rendering for play
###

### ROUTING ###
class @PlayController extends RouteController
  template: 'playMain'
  fastRender: true
  waitOn: ->

  data: ->


console.log "Router: configured #{PlayController.name}"

### RENDERED ###

### EVENTS ###

### HELPERS ###
