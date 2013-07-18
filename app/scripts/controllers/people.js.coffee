@PeopleCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  $scope.peopleConcepts = concepts.getVisionConcepts()
]
