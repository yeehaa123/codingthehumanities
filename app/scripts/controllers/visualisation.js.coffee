@VisualisationCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  init = ->  
    $scope.pastConcepts = concepts.getPastConcepts() 
    $scope.futureConcepts = concepts.getFutureConcepts() 

  init()
]
