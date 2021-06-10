Session                  = require 'shared/services/session'
AbilityService    = require 'shared/services/ability_service'

angular.module('loomioApp').directive 'threadCard', ->
  scope: {discussion: '='}
  restrict: 'E'
  templateUrl: 'generated/components/thread_card/thread_card.html'
  controller: ['$scope', ($scope) ->
      $scope.isSiteAdmin = AbilityService.isSiteAdmin()
      # Get the stage reached by the current user
      # May be less than current discussion stage if they need to complete a poll
      discussionStage = Session.user().discussionStages[$scope.discussion.id]
      if typeof(Session.user().discussionStages) == 'undefined' || typeof(discussionStage) == 'undefined'
        discussionStage = 0
      $scope.discussionStage = discussionStage
      $scope.allStages = [0 .. $scope.discussion.numStages].reverse()
      if discussionStage < $scope.discussion.numStages + 1
        polls = $scope.discussion.activePolls()
        if polls.length > 0
            $scope.poll = _.sortBy(polls, 'title')[discussionStage]
            $scope.waitingForPoll = true
        else
            $scope.waitingForPoll = false
      else
        $scope.waitingForPoll = false
  ]

