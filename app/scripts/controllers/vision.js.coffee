@VisionCtrl = ['$scope', 'visionFactory', ($scope, visionFactory) ->
  concepts = visionFactory

  init = ->  
    $scope.visionConcepts = concepts.query {conceptName: 'concepts'}, ->
      $.each($scope.visionConcepts, (index, concept) ->
        console.log(concept)
        concept.rank =->
          if concept.ranked then "ranked"
        )
  init()
]
