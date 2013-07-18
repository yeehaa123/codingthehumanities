@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div ng-repeat='concept in list' class='span2 {{concept.rank()}}'>{{ concept.name }}</div></div>"
