angular.module('loomioApp').directive 'timeago', ->
  scope: {timestamp: '=', stage: '=', treatment: '=', breakoutId: '='}
  restrict: 'E'
  templateUrl: 'generated/components/timeago/timeago.html'
  replace: true
