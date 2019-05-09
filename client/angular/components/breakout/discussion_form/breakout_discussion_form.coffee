Session        = require 'shared/services/session'
AbilityService = require 'shared/services/ability_service'
I18n           = require 'shared/services/i18n'

angular.module('loomioApp').directive 'breakoutDiscussionForm', ->
  scope: {}
  templateUrl: 'generated/components/breakout/discussion_form/breakout_discussion_form.html'
  controller: ['$scope', ($scope) ->
    return
  ]
