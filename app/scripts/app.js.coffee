@App = angular.module('codingTheHumanitiesApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/_visualisation.html',
        controller: 'MainCtrl'
      }).when('/vision', {
        templateUrl: 'views/_vision.html' 
        controller: 'VisionCtrl'
      }).when('/people', {
        templateUrl: 'views/_people.html' 
        controller: 'PeopleCtrl'
      }).when('/events', {
        templateUrl: 'views/_events.html' 
        controller: 'EventsCtrl'
      }).when('/code', {
        templateUrl: 'views/_code.html' 
        controller: 'CodeCtrl'
      }).otherwise({
        redirectTo: '/' 
      })

@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div class='span2' ng-repeat='concept in list'>{{ concept }}</div></div>"
