@App.factory 'conceptFactory', ['$resource', ($resource) ->
  $resource 'http://twitter-humanities.herokuapp.com/api/:conceptName',
    {conceptName: '@name'}
]

@App.factory 'visionFactory', ['$resource', ($resource) ->
  $resource 'http://gist-humanities.herokuapp.com/api/:conceptName',
    {conceptName: '@name'}
]
