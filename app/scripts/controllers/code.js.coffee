@CodeCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  $scope.codeConcepts = concepts.getVisionConcepts()
]
