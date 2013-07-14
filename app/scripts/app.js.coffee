@App = angular.module('codingTheHumanitiesApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/_visualisation.html',
        controller: 'MainCtrl'
      })
      .otherwise({
        template: "<div class='text span12'>HELLO!!!!</div>"
      })

@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div class='span2' ng-repeat='concept in list'>{{ concept }}</div></div>"
