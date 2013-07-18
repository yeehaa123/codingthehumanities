@EventsCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  $scope.eventsConcepts = concepts.getVisionConcepts()
]
