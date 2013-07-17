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
  template: "<div class='span6'><div class='span2' ng-repeat='concept in list'>{{ concept.name }}</div></div>"

@App.factory 'conceptFactory', ->
  pastConcepts = [
    { 
      "name": "hiring",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "art",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "degrees",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "oxford",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "pay",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "survey",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "teacher",
      "ranked": false,
      "tweeted_now": false 
    },
    {
      "name": "job",
      "ranked": false,
      "tweeted_now": false 
    },
    {
      "name": "science",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "national",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "new",
      "ranked": false,
      "tweeted_now": false 
    }
  ]

  futureConcepts = [
    { 
      "name": "big data",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "html",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "learning",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "coding",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "art",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "research",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "literacy",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    {
      "name": "css",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    {
      "name": "creative",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "javascript",
      "ranked": "false",
      "tweeted_now": "false" 
    },
    { 
      "name": "global",
      "ranked": "false",
      "tweeted_now": "false" 
    }
  ]

  factory = {}

  factory.getPastConcepts = ()->
    pastConcepts

  factory.getFutureConcepts = ()->
    futureConcepts

  factory
