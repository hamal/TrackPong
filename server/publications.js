// Generated by CoffeeScript 1.8.0

/* PUBLISH FUNCTIONS */

(function() {
  Meteor.publish('playersPub', function() {
    return Players.find({});
  });

  Meteor.publish('playerPub', function(username) {
    console.log(username);
    return Players.find({
      username: username
    });
  });

  Meteor.publish('matchListPub', function() {
    return Matches.find({});
  });

  Meteor.publish('matchPub', function(matchId) {
    console.log(matchId);
    return Matches.find({
      _id: matchId
    });
  });

}).call(this);

//# sourceMappingURL=publications.js.map