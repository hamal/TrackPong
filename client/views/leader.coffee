###
  Layout & rendering for leader
###

### ROUTING ###
class @LeaderController extends RouteController
  template: 'leaderMain'
  fastRender: true
  waitOn: ->

  data: ->


console.log "Router: configured #{LeaderController.name}"

### RENDERED ###

### EVENTS ###

### HELPERS ###
