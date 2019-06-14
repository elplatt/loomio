Records = require 'shared/services/records'
AppConfig = require 'shared/services/app_config'
LmoUrlService = require 'shared/services/lmo_url_service'

{ applyDiscussionStartSequence } = require 'shared/helpers/apply'

angular.module('loomioApp').factory 'DiscussionStartModal', ->
  templateUrl: 'generated/components/discussion/start_modal/discussion_start_modal.html'
  controller: ['$scope', 'discussion', '$mdDialog', '$location', ($scope, discussion, $mdDialog, $location) ->
    $scope.maxThreads = discussion.group().parentOrSelf().subscriptionMaxThreads
    $scope.threadCount = discussion.group().parentOrSelf().orgDiscussionsCount
    $scope.maxThreadsReached = $scope.maxThreads && $scope.threadCount >= $scope.maxThreads
    $scope.subscriptionActive = discussion.group().parentOrSelf().subscriptionActive
    $scope.upgradeUrl = AppConfig.baseUrl + 'upgrade'
    $scope.canStartThread = $scope.subscriptionActive && !$scope.maxThreadsReached

    $scope.discussion = discussion.clone()
    
    $scope.currentStep = 'save'
    
    console.log $location.search()
    console.log LmoUrlService.params()
    console.log LmoUrlService.params
    
    $scope.submit = () ->
      if $scope.currentStep == 'save'
        $scope.discussion.save().then ->
            $scope.poll = Records.polls.build
              title:        $scope.discussion.title
              pollType:     'ranked_choice'
              discussionId: $scope.discussion.id
              groupId:      discussion.group.id
            $scope.currentStep = 'ranked_choice'
      else if $scope.currentStep == 'ranked_choice'
        $scope.poll.save().then ->
            $mdDialog.hide()
  ]
