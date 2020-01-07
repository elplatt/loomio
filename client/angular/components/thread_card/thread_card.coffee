Session                  = require 'shared/services/session'

angular.module('loomioApp').directive 'threadCard', ->
  scope: {discussion: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_card/thread_card.html'
  controller: ['$scope', ($scope) ->
      discussionStage = Session.user().discussionStages[$scope.discussion.id]
      if typeof(discussionStage) == 'undefined'
        discussionStage = 0
      if discussionStage < $scope.discussion.numStages + 1
        $scope.waitingForPoll = true
      else
        $scope.waitingForPoll = false
  ]

