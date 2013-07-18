@App.factory 'conceptFactory', ->
  pastConcepts = [
    { 
      "name": "hiring",
      "ranked": true,
      "tweeted_now": false 
    },
    { 
      "name": "art",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "degrees",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "oxford",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "pay",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "survey",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "teacher",
      "ranked": true,
      "tweeted_now": false 
    },
    {
      "name": "job",
      "ranked": false,
      "tweeted_now": false 
    },
    {
      "name": "science",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "national",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "new",
      "ranked": false,
      "tweeted_now": false 
    }
  ]

  futureConcepts = [
    { 
      "name": "big data",
      "ranked": true,
      "tweeted_now": false 
    },
    { 
      "name": "html",
      "ranked": true,
      "tweeted_now": false 
    },
    { 
      "name": "learning",
      "ranked": true,
      "tweeted_now": false 
    },
    { 
      "name": "coding",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "art",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "research",
      "ranked": true,
      "tweeted_now": false 
    },
    { 
      "name": "literacy",
      "ranked": false,
      "tweeted_now": false 
    },
    {
      "name": "css",
      "ranked": false,
      "tweeted_now": false 
    },
    {
      "name": "creative",
      "ranked": false,
      "tweeted_now": false 
    },
    { 
      "name": "javascript",
      "ranked": true,
      "tweeted_now": false 
    },
    { 
      "name": "global",
      "ranked": true,
      "tweeted_now": false 
    }
  ]

  visionConcepts = [
    { 
      "name": "-",
      "ranked": false
    },
    { 
      "name": "why",
      "ranked": true
    },
    { 
      "name": "-",
      "ranked": false
    },
    { 
      "name": "-",
      "ranked": false
    },
    { 
      "name": "what",
      "ranked": true
    },
    { 
      "name": "when",
      "ranked": true
    },
    { 
      "name": "who",
      "ranked": true
    },
    { 
      "name": "-",
      "ranked": false
    },
    { 
      "name": "where",
      "ranked": true
    },
    { 
      "name": "-",
      "ranked": false
    },
    { 
      "name": "who",
      "ranked": true
    }
  ]

  factory = {}

  factory.getPastConcepts = ()->
    $.each(pastConcepts, (index, concept) -> 
      concept.rank = ->
        if concept.ranked  then "ranked"
    )
    pastConcepts

  factory.getFutureConcepts = ()->
    $.each(futureConcepts, (index, concept) -> 
      concept.rank = ->
        if concept.ranked  then "ranked"
    )
    futureConcepts

  factory.getVisionConcepts = ()->
    $.each(visionConcepts, (index, concept) -> 
      concept.rank = ->
        if concept.ranked  then "ranked"
    )
    visionConcepts

  factory
