{ submitOnEnter } = require 'shared/helpers/keyboard'

angular.module('loomioApp').directive 'pollCommonFormActions', ['$rootScope', ($rootScope) ->
  replace: true
  templateUrl: 'generated/components/poll/common/form_actions/poll_common_form_actions.html'
  controller: ['$scope', ($scope) ->
    submitOnEnter $scope
  ]
]
