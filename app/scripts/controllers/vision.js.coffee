@VisionCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  init = ->  
    $scope.visionConcepts = concepts.query {conceptName: 'concepts'}, ->
      $.each($scope.visionConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
  init()
]
