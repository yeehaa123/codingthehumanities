@App = angular.module('codingTheHumanitiesApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/_visualisation.html',
        controller: 'MainCtrl'
      }).when('/vision', {
        templateUrl: 'views/_vision.html' 
      }).when('/people', {
        templateUrl: 'views/_people.html' 
      }).when('/events', {
        templateUrl: 'views/_events.html' 
      }).when('/code', {
        templateUrl: 'views/_code.html' 
      }).otherwise({
        templateUrl: 'views/_vision.html' 
      })

@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div class='span2' ng-repeat='concept in list'>{{ concept }}</div></div>"
