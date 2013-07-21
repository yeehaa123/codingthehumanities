@VisualisationCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  init = ->  
    $scope.pastConcepts = concepts.query {conceptName: 'past_concepts'}, ->
      $.each($scope.pastConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )

    $scope.futureConcepts = concepts.query {conceptName: 'future_concepts'}, ->
      $.each($scope.futureConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
  init()
]
