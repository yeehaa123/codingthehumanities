@EventsCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  init = ->  
    $scope.eventsConcepts = concepts.query {conceptName: 'concepts'}, ->
      $.each($scope.eventsConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
  init()
]
