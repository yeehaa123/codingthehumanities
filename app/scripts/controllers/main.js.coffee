@MainCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  $scope.pastConcepts = concepts.getPastConcepts() 

  $scope.futureConcepts = concepts.getFutureConcepts() 
  $scope.title = "Coding the Humanities"
]
