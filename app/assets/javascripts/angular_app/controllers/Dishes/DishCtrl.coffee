class DishCtrl extends BaseCtrl
  @register app

  @inject '$scope', '$location', '$window', 'DishGroup', 'Dish'

  initialize: ->
    @$scope.groups = @DishGroup.all()
    @dishService = new @Dish()

  getDishes: (groupId)->
    @$scope.dishes = @dishService.getByGroup groupId

  delete: (dish)->
    index = @$scope.dishes.indexOf dish
    if @$window.confirm("Ви дiйсно xочете видалити  #{dish.name}?")
      @dishService.delete(dish.id).then =>
        @$scope.dishes.splice index, 1

  show: (dish)->
    @$location.path "/dish/#{dish.id}"

  edit: (dish)->
    @$location.path "/dishes/#{dish.id}/edit"

  new: ->
    @$location.path "/dishes/new"
