@PeopleCtrl = ['$scope', 'conceptFactory', ($scope, conceptFactory) ->
  concepts = conceptFactory

  init = ->  
    $scope.peopleConcepts = concepts.query {conceptName: 'concepts'}, ->
      $.each($scope.peopleConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"
        )
  init()
]
