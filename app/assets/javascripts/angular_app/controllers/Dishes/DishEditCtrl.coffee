class DishEditCtrl extends BaseCtrl
  @register app
  @inject '$scope', 'Dish', 'DishGroup', 'Food', '$window', '$location', '$routeParams', 'Ingredient'

  initialize: ->
    @$scope.new_ingredient = {food: undefined , quantity: 100}
    @$scope.groups = @DishGroup.all()
    @$scope.foods = new @Food().all()
    @dish_service = new @Dish()
    @ingredient_service = new @Ingredient()
    @$scope.ingredients = @ingredient_service.findByDish(@$routeParams.id)
    @$scope.dish = @dish_service.find @$routeParams.id


  newIngredient: ->
    @ingredient_service.create({
      dish_id: @$scope.dish.id
      food_id: @$scope.new_ingredient.food.id
      quantity: @$scope.new_ingredient.quantity / 1000
    }).then (data)=>
        ingredient = @$scope.new_ingredient
        ingredient.id = data.id
        ingredient.quantity = data.quantity
        @$scope.ingredients.push ingredient
        @$scope.new_ingredient = {food: undefined , quantity: 100}
  deleteIngredient: (index,ingr)->
    @ingredient_service.delete(ingr.id).then =>
      @$scope.ingredients.splice index, 1
  cancel: ->
    @$window.history.back()
  submit: ->
    @$scope.dish.dish_group_id = @$scope.dish.dish_group.id
    @dish_service.update(@$scope.dish).then =>
      @$location.path '/dishes'