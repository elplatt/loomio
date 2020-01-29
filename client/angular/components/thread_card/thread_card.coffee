Session                  = require 'shared/services/session'
AbilityService    = require 'shared/services/ability_service'

angular.module('loomioApp').directive 'threadCard', ->
  scope: {discussion: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_card/thread_card.html'
  controller: ['$scope', ($scope) ->
      $scope.isSiteAdmin = AbilityService.isSiteAdmin()
      discussionStage = Session.user().discussionStages[$scope.discussion.id]
      if typeof(Session.user().discussionStages) == 'undefined' || typeof(discussionStage) == 'undefined'
        discussionStage = 0
      if discussionStage < $scope.discussion.numStages + 1
        $scope.waitingForPoll = true
        polls = $scope.discussion.activePolls()
        $scope.poll = _.sortBy(polls, 'title')[discussionStage]
      else
        $scope.waitingForPoll = false
  ]

