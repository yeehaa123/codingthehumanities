@App.directive 'concepts', ->
  restrict: "E",
  replace: true,
  scope: {
    list: "="
  },
  template: "<div class='concepts span6'><div ng-repeat='concept in list' class='span2 {{concept.ranked}} {{concept.live}}'>{{ concept.name }}</div></div>"

@App.directive 'menu', ->
  restrict: "E",
  replace: true,
  scope: {
    list: "=",
    clickMenuLink: "&"
  },
  template: "<div class='span6 menu'><div ng-repeat='concept in list' class='span6 menu_item {{concept.ranked}} {{concept.live}}' ng-click='clickMenuLink({concept: concept})'>{{ concept.name }}</div></div>"

@App.directive 'codemenu', ->
  restrict: "E",
  replace: true,
  scope: {
    list: "=",
    clickMenuLink: "&"
  },
  template: "<div class='span6 menu'><div ng-repeat='concept in list' class='span3 menu_item code {{concept.ranked}} {{concept.live}}' ng-click='clickMenuLink({concept: concept})'>{{ concept.name }}</div></div>"

@App.directive 'profile', ->
  restrict: "E",
  replace: true,
  scope: {
    concept: "="
  },
  template: "<div class='profile span6'><div class='box'><img ng-src='{{concept.image}}'/></div><h3>{{ concept.name }}</h3><div ng-bind-html-unsafe='concept.description'></div></div>"

@App.directive 'textblock', ->
  restrict: "E",
  replace: true,
  scope: {
    concept: "="
  },
  template: "<div class='text span6'><div class='box'><img ng-src='{{concept.image}}'/></div><h3>{{ concept.name }}</h3><div ng-bind-html-unsafe='concept.description'></div></div>"
