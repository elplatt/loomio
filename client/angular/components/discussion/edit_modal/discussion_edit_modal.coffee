Records = require 'shared/services/records'

{ applySequence } = require 'shared/helpers/apply'
{ obeyMembersCanAnnounce } = require 'shared/helpers/apply'

angular.module('loomioApp').factory 'DiscussionEditModal', ->
  templateUrl: 'generated/components/discussion/edit_modal/discussion_edit_modal.html'
  controller: ['$scope', 'discussion', '$mdDialog', ($scope, discussion, $mdDialog) ->
    $scope.discussion = discussion

    console.log discussion
    console.log $scope.discussion

    $scope.currentStep = 'save'
    $scope.submit = () ->
      if $scope.currentStep == 'save'
        $scope.discussion.save().then ->
            $mdDialog.hide()
  ]
