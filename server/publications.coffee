
### PUBLISH FUNCTIONS ###
Meteor.publish 'playersPub', ->
  Players.find({})

Meteor.publish 'playerPub', (username) ->
  console.log username
  Players.find(username: username)

Meteor.publish 'matchListPub', ->
  Matches.find({})

Meteor.publish 'matchPub', (matchId) ->
  console.log matchId
  Matches.find(_id: matchId)
