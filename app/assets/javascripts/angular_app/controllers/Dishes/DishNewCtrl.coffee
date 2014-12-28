class DishNewCtrl extends BaseCtrl
  @register app
  @inject '$scope', 'Dish', 'DishGroup', 'Food', '$window', '$location'

  initialize: ->
    @$scope.new_ingredient = {food: undefined , quantity: 100}
    @$scope.groups = @DishGroup.all()
    @$scope.foods = new @Food().all()
    @dish_service = new @Dish()
    @$scope.ingredients = []

  newIngredient: ->
    @$scope.ingredients.push @$scope.new_ingredient
    @$scope.new_ingredient = {food: undefined , quantity: 100}
  deleteIngredient: (index,ingr)->
    @$scope.ingredients.splice index, 1
  cancel: ->
    @$window.history.back()
  submit: ->
    @$scope.dish.ingredients = @$scope.ingredients
    @dish_service.create(@$scope.dish).then =>
      @$location.path '/dishes'