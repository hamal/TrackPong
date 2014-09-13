###
  Layout & rendering for index
###

### ROUTING ###
class @ProfileController extends RouteController
  template: 'profileMain'
  fastRender: true
  waitOn: ->

  data: ->


console.log "Router: configured #{ProfileController.name}"

### RENDERED ###

### EVENTS ###

### HELPERS ###
