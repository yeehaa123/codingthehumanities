@PeopleCtrl = ['$scope', 'visionFactory', ($scope, visionFactory) ->
  concepts = visionFactory

  init = ->  
    $scope.peopleConcepts = concepts.query {conceptName: 'people'}, ->
      $.each($scope.peopleConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
      $scope.currentConcept = $scope.peopleConcepts[0]
  init()

  $scope.setCurrentConcept = (concept) ->
    $scope.currentConcept = concept
]
