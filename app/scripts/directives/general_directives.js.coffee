@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope: {
    list: "="
  },
  template: "<div class='span6'><div ng-repeat='concept in list' class='span2 {{concept.ranked}} {{concept.live}}'>{{ concept.name }}</div></div>"

@App.directive 'menu', ->
  restrict: "E",
  replace: true,
  scope: {
    list: "=",
    clickMenuLink: "&"
  },
  template: "<div class='span6 menu'><div ng-repeat='concept in list' class='menu_item {{concept.ranked}} {{concept.live}}' ng-click='clickMenuLink({concept: concept})'>{{ concept.name }}</div></div>"

@App.directive 'textblock', ->
  restrict: "E",
  replace: true,
  scope: {
    concept: "="
  },
  template: "<div class='text span6'><h3>{{ concept.name }}</h3><div ng-bind-html-unsafe='concept.description'></div></div>"
