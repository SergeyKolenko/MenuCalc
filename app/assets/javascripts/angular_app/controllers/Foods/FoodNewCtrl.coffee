class FoodNewCtrl extends BaseCtrl
  @register app

  @inject '$scope', 'Food', 'FoodGroup', '$location'

  initialize: ->
    @food = new @Food()
    @$scope.groups = @FoodGroup.all()

  submit: ->
    @food.create(@$scope.food).then =>
      @$location.path '/foods'