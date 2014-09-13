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

### HELPERS ###
