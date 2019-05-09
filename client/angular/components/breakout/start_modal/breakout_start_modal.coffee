Records = require 'shared/services/records'
AppConfig = require 'shared/services/app_config'

angular.module('loomioApp').factory 'BreakoutStartModal', ->
  templateUrl: 'generated/components/breakout/start_modal/breakout_start_modal.html'
  controller: ['$scope', ($scope) ->
    $scope.step = 'ranked_choice'
  ]
