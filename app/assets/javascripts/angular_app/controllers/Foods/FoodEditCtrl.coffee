class FoodEditCtrl extends BaseCtrl
  @register app

  @inject '$scope', '$location', 'Food', '$routeParams', 'FoodGroup'

  initialize: ->
    @foodService = new @Food()
    @$scope.groups = @FoodGroup.all()
    @$scope.food = @foodService.find @$routeParams.id

  submit: ->
    @foodService.update(@$scope.food).then =>
      @$location.path '/foods'
