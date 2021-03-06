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
    ingrad = @$scope.new_ingredient
    ingrad.quantity /= 1000
    @$scope.ingredients.push ingrad
    @$scope.new_ingredient = {food: undefined , quantity: 100}
  deleteIngredient: (index,ingr)->
    @$scope.ingredients.splice index, 1
  cancel: ->
    @$window.history.back()
  submit: ->
    @$scope.dish.ingredients = @$scope.ingredients
    @$scope.dish.dish_group_id = @$scope.dish.dish_group.id
    @dish_service.create(@$scope.dish).then =>
      @$location.path '/dishes'