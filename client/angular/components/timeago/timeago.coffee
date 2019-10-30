angular.module('loomioApp').directive 'timeago', ->
  scope: {timestamp: '=', stage: '='}
  restrict: 'E'
  templateUrl: 'generated/components/timeago/timeago.html'
  replace: true
