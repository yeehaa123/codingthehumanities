!function(){this.App=angular.module("codingTheHumanitiesApp",[]),this.App.config(function(a){return a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).otherwise({redirectTo:"/"})})}.call(this),function(){this.MainCtrl=["$scope",function(a){return a.concepts=["hiring","art","degrees","oxford","pay","survey","teacher","job","science","national","new"],a.concepts2=["big data","html","learning","coding","art","research","literacy","css","creative","javascript","global"],a.title="Coding the Humanities"}]}.call(this);