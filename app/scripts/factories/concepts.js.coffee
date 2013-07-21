@App.factory 'conceptFactory', ['$resource', ($resource) ->
  $resource 'http://twitter-humanities.herokuapp.com/api/:conceptName',
    {conceptName: '@name'}
]
