@app = angular.module('MenuCalc', ['ngResource', 'ngRoute','ngSanitize', 'templates','ui.bootstrap', 'ui.select'])

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/', redirectTo: '/dishes'
  $routeProvider.when '/dishes', templateUrl: 'dishes/index.html', controller: 'DishCtrl'
  $routeProvider.when '/dish/:id', templateUrl: 'dishes/show.html', controller: 'DishShowCtrl'
  $routeProvider.when '/dishes/new', templateUrl: 'dishes/new.html', controller: 'DishNewCtrl'
  $routeProvider.when '/dishes/:id/edit', templateUrl: 'dishes/edit.html', controller: 'DishEditCtrl'
  $routeProvider.when '/dish_groups', templateUrl: 'dish_groups/index.html', controller: 'DishGroupCtrl'
  $routeProvider.when '/food_groups', templateUrl: 'food_groups/index.html', controller: 'FoodGroupCtrl'
  $routeProvider.when '/foods', templateUrl: 'foods/index.html', controller: 'FoodsCtrl'
  $routeProvider.when '/foods/new', templateUrl: 'foods/new.html', controller: 'FoodNewCtrl'
  $routeProvider.when '/foods/:id/edit', templateUrl: 'foods/edit.html', controller: 'FoodEditCtrl'
]
