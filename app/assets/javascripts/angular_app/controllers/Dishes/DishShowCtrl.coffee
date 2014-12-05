class DishShowCtrl extends BaseCtrl
  @register app
  @inject '$scope', 'Dish', 'DishGroup', '$location', '$window', '$routeParams', 'Ingredient'

  initialize: ->
    @dishService = new @Dish()
    @inrgService = new @Ingredient
    @dishService.find(@$routeParams.id).then (data)=>
      @$scope.dish = data
      @$scope.dish.group = @DishGroup.find data.dish_group_id
      @$scope.dish.ingredients =  @inrgService.findByDish data.id