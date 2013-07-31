@VisionCtrl = ['$scope', 'visionFactory', ($scope, visionFactory) ->
  concepts = visionFactory

  init = ->  
    $scope.visionConcepts = concepts.query {conceptName: 'vision'}, ->
      $.each($scope.visionConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
      $scope.currentConcept = $scope.visionConcepts[0]
  init()

  $scope.setCurrentConcept = (concept) ->
    $scope.currentConcept = concept
]
