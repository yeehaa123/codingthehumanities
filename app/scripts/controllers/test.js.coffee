@TestCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  $http.get('http://twitter-humanities.herokuapp.com/api/concepts').success (data) -> 
    $scope.codeConcepts = data
]
