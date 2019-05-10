Records       = require 'shared/services/records'
EventBus      = require 'shared/services/event_bus'
LmoUrlService = require 'shared/services/lmo_url_service'

{ submitDiscussion } = require 'shared/helpers/form'
{ submitOnEnter }    = require 'shared/helpers/keyboard'

angular.module('loomioApp').directive 'discussionFormActions', ->
  replace: true
  templateUrl: 'generated/components/discussion/form_actions/discussion_form_actions.html'
  controller: ['$scope', ($scope) ->
    submitOnEnter $scope
  ]
