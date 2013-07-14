@App = angular.module('codingTheHumanitiesApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .otherwise({
        redirectTo: '/'
      })

@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div class='span2' ng-repeat='concept in list'>{{ concept }}</div></div>"
