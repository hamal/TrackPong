### ROUTING ###

# Router main template
Router.configure
  layoutTemplate: 'layoutMain'
  notFoundTemplate: 'fourZeroFour'
  # loadingTemplate: 'loading'
  # render the template named header to the 'header' yield
  # waitOn: null => the header has not to wait the subscriptions but has to be rendered immediately
  yieldTemplates:
    'headerMain': {to: 'header', waitOn : null}
    'footerMain': {to: 'footer'}

# Router.onBeforeAction('dataNotFound')

# Define client routes
Router.map ->
  # Landing page
  @route 'indexRoute', path: '/', controller: 'IndexController'
  @route 'profileRoute', path: '/u', controller: 'ProfileController'
  @route 'playRoute', path: '/play', controller: 'PlayController'
  @route 'matchRoute', path: '/match', controller: 'MatchController'
  @route 'leaderRoute', path: '/leaderboard', controller: 'LeaderController'

# Configure the progress bar
IronRouterProgress.configure
  spinner : false

console.log "Configured router, #{Router.routes.length} routes defined"
