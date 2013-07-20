@TestCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  init = ->  
    $scope.codeConcepts = [{"name": "loading..."}]
    $http.get('http://twitter-humanities.herokuapp.com/api/concepts')
      .success (data) -> 
        $scope.codeConcepts = data

  init()
]
