class FoodsCtrl extends  BaseCtrl
  @register app
  @inject '$scope', 'FoodGroup', 'Food', '$window', '$location'

  initialize: ->
    @$scope.groups = @FoodGroup.all()
    @foodService = new @Food()

  getFoods: (groupId) ->
    @$scope.foods = @foodService.getByGroup groupId

  delete: (food)->
    index = @$scope.foods.indexOf food
    if @$window.confirm("Ви дiйсно xочете видалити  #{food.name}?")
      @foodService.delete(food.id).then =>
        @$scope.foods.splice index, 1

  edit: (food)->
    @$location.path "/foods/#{food.id}/edit"

  new: ->
    @$location.path '/foods/new'