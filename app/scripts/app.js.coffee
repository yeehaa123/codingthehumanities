@App = angular.module('codingTheHumanitiesApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/_visualisation.html',
        controller: 'MainCtrl'
      })
      .otherwise({
        templateUrl: 'views/_vision.html' 
      })

@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div class='span2' ng-repeat='concept in list'>{{ concept }}</div></div>"
