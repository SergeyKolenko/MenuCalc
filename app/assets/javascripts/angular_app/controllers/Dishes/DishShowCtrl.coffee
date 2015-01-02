class DishShowCtrl extends BaseCtrl
  @register app
  @inject '$scope', 'Dish', 'DishGroup', '$location', '$window', '$routeParams', 'Ingredient'

  initialize: ->
    @dish_service = new @Dish()
    @ingredient_service = new @Ingredient()
    @$scope.ingredients = @ingredient_service.findByDish(@$routeParams.id)
    @$scope.dish = @dish_service.find @$routeParams.id

  edit: ->
    $location.path "dishes/#{@$scope.dish.id}/edit"

  delete: ->
    if @$window.confirm("Ви дiйсно xочете видалити  #{@$scope.dish.name}?")
      @dishService.delete(@$scope.dish.id).then =>
        $location.path "/dishes"