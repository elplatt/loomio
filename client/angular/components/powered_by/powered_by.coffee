AppConfig = require 'shared/services/app_config'
Session         = require 'shared/services/session'
angular.module('loomioApp').directive 'poweredBy', ->
  scope: {}
  restrict: 'E'
  templateUrl: 'generated/components/powered_by/powered_by.html'
  controller: ['$scope', ($scope) ->
    $scope.privacyUrl   = AppConfig.theme.privacy_url
    $scope.termsUrl     = AppConfig.theme.terms_url
    $scope.frontPageUrl = AppConfig.baseUrl + "?frontpage"
    $scope.showFrontPage = AppConfig.baseUrl != "https://www.loomio.org/"
    $scope.signOut = ->
      Session.signOut()
  ]
