Records = require 'shared/services/records'
AppConfig = require 'shared/services/app_config'
LmoUrlService = require 'shared/services/lmo_url_service'


angular.module('loomioApp').factory 'DiscussionStartModal', ->
  templateUrl: 'generated/components/discussion/start_modal/discussion_start_modal.html'
  controller: ['$scope', 'discussion', ($scope, discussion) ->
    $scope.maxThreads = discussion.group().parentOrSelf().subscriptionMaxThreads
    $scope.threadCount = discussion.group().parentOrSelf().orgDiscussionsCount
    $scope.maxThreadsReached = $scope.maxThreads && $scope.threadCount >= $scope.maxThreads
    $scope.subscriptionActive = discussion.group().parentOrSelf().subscriptionActive
    $scope.upgradeUrl = AppConfig.baseUrl + 'upgrade'
    $scope.canStartThread = $scope.subscriptionActive && !$scope.maxThreadsReached

    $scope.discussion = discussion.clone()
    
    $scope.currentStep = 'save'
    
    $scope.submit = () ->
      if $scope.currentStep == 'save'
        $scope.poll = Records.polls.build
          title:       LmoUrlService.params().title
          pollType:    'ranked_choice'
          groupId:     parseInt(LmoUrlService.params().group_id)
        $scope.currentStep = 'ranked_choice'
  ]
