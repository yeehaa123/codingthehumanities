@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6'><div ng-repeat='concept in list' class='span2 {{concept.ranked}} {{concept.live}}'>{{ concept.name }}</div></div>"

@App.directive 'menu', ->
  restrict: "E",
  replace: true,
  scope : {
    list: "="
  },
  template: "<div class='span6 menu'><div ng-repeat='concept in list' class='menu_item {{concept.ranked}} {{concept.live}}'>{{ concept.name }}</div></div>"
