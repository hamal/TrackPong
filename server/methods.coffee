# Server side methods
Meteor.methods
  newMatch: (playerOne, playerTwo) ->
    console.log "#{playerOne} - #{playerTwo}"
    matchId = Matches.insert
      timestamp: moment().toISOString()
      playerOne: playerOne
      scoreOne: 0
      playerTwo: playerTwo
      scoreTwo: 0
      state: 'ongoing'
    console.log "Inserted match: #{matchId}"
    matchId
  newPlayer: (username, name, surname, deviceId) ->
    console.log "#{username}"
    playerId = Players.insert
      timestamp: moment().toISOString()
      username: username
      name: name
      surname: surname
      deviceId: deviceId
      score: 0
      won: 0
      lost: 0
    console.log "Inserted match: #{playerId}"
    playerId
