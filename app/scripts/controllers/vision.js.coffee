@VisionCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  $scope.visionConcepts = concepts.getVisionConcepts()
]
