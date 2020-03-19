Session  = require 'shared/services/session'
Records  = require 'shared/services/records'
EventBus = require 'shared/services/event_bus'
AbilityService = require 'shared/services/ability_service'

{ listenForLoading } = require 'shared/helpers/listen'
{ myLastStanceFor }  = require 'shared/helpers/poll'

angular.module('loomioApp').directive 'pollCommonCard', ->
  scope: {poll: '='}
  templateUrl: 'generated/components/poll/common/card/poll_common_card.html'
  replace: true
  controller: ['$scope', ($scope) ->
    console.log $scope.poll
    $scope.isSiteAdmin = AbilityService.isSiteAdmin()
    
    Records.polls.findOrFetchById($scope.poll.key)

    $scope.buttonPressed = false
    EventBus.listen $scope, 'showResults', ->
      $scope.buttonPressed = true

    $scope.showResults = ->
      $scope.buttonPressed || myLastStanceFor($scope.poll)? || $scope.poll.isClosed()

    EventBus.listen $scope, 'stanceSaved', ->
      EventBus.broadcast $scope, 'refreshStance'

    listenForLoading $scope
  ]
