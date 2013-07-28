@VisualisationCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  init = ->  
    $scope.pastConcepts = concepts.query {conceptName: 'past_concepts'}, ->
      $.each $scope.pastConcepts, (index, concept) ->
        concept.ranked = "ranked" if concept.ranked
        console.log concept

    $scope.futureConcepts = concepts.query {conceptName: 'future_concepts'}, ->
      $.each $scope.futureConcepts, (index, concept) ->
        concept.ranked = "ranked" if concept.ranked

    $scope.pusher = new Pusher('26da32a9b80140bcf9a7')
    $scope.channel = $scope.pusher.subscribe('concepts')

  init()
  $scope.channel.bind 'live', (data)-> 
    $scope.$apply ->
      console.log($scope.concepts)
      $.each $scope.pastConcepts, (index, concept) ->
        concept.live = false
        concept.live = "live" if concept.name == data.message 
      $.each $scope.futureConcepts, (index, concept) ->
        concept.live = false
        concept.live = "live" if concept.name == data.message 
]
