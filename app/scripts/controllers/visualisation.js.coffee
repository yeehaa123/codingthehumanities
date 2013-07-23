@VisualisationCtrl = ['$scope', 'conceptFactory', '$http', ($scope, conceptFactory, $http) ->
  concepts = conceptFactory

  init = ->  
    $scope.pastConcepts = concepts.query {conceptName: 'past_concepts'}, ->
      $.each $scope.pastConcepts, (index, concept) ->
        concept.ranked = "ranked" if concept.ranked
        concept.live = ""

    $scope.futureConcepts = concepts.query {conceptName: 'future_concepts'}, ->
      $.each $scope.futureConcepts, (index, concept) ->
        concept.rank =->
          if concept.ranked then "ranked"

    $scope.pusher = new Pusher('26da32a9b80140bcf9a7')
    $scope.channel = $scope.pusher.subscribe('test_channel')

  init()
  $scope.channel.bind 'my_event', (data)-> 
    $scope.$apply ->
      console.log($scope.concepts)
      $.each $scope.pastConcepts, (index, concept) ->
        concept.live = false
        concept.live = "live" if concept.name == data.message 
      $.each $scope.futureConcepts, (index, concept) ->
        concept.live = false
        concept.live = "live" if concept.name == data.message 
]
