@CodeCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  $scope.codeConcepts = [{"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."}, {"name": "Loading..."} ]
  init = ->  
    $http.get('http://twitter-humanities.herokuapp.com/api/concepts').success (data) -> 
     $scope.codeConcepts = data

  init()
]
