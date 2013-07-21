@CodeCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  init = ->  
    $scope.codeConcepts = concepts.query {conceptName: 'concepts'}, ->
      $.each($scope.codeConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
  init()
]
