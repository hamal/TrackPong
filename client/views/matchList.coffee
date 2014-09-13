###
  Layout & rendering for matchList
###

### ROUTING ###
class @MatchListController extends RouteController
  template: 'matchListMain'
  fastRender: true
  waitOn: ->
    Meteor.subscribe 'matchListPub'
  data: ->
    matches: Matches.find({}, sort: timestamp: 1)


console.log "Router: configured #{MatchListController.name}"

### RENDERED ###

### EVENTS ###


### HELPERS ###
