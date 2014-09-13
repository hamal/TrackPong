###
  Layout & rendering for match
###

### ROUTING ###
class @MatchController extends RouteController
  template: 'matchMain'
  fastRender: true
  waitOn: ->

  data: ->


console.log "Router: configured #{MatchController.name}"

### RENDERED ###

### EVENTS ###

### HELPERS ###
