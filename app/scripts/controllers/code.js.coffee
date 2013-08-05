@CodeCtrl = ['$scope', 'visionFactory', ($scope, visionFactory) ->
  concepts = visionFactory

  init = ->  
    $scope.codeConcepts = concepts.query {conceptName: 'code'}, ->
      $.each($scope.codeConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
      $scope.currentConcept = $scope.codeConcepts[0]
  init()

  $scope.setCurrentConcept = (concept) ->
    $scope.currentConcept = concept
]
