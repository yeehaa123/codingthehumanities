@App = angular.module('codingTheHumanitiesApp', ['ngResource'])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/_visualisation.html',
        controller: 'VisualisationCtrl'
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
      }).when('/test', {
        templateUrl: 'views/_code.html' 
        controller: 'TestCtrl'
      }).otherwise({
        redirectTo: '/' 
      })
