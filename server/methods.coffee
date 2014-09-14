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
