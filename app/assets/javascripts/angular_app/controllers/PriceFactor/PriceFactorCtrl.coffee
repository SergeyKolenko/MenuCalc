class PriceFactorCtrl extends BaseCtrl
  @register app

  @inject '$scope', 'PriceFactor', '$window', 'AlertsService'

  initialize: ->
    @factor_service = new @PriceFactor()
    @$scope.price_factor = @factor_service.findByName 'price_factor'

  cancel: ->
    @$window.history.back()

  save: ->
    @factor_service.update(@$scope.price_factor).then =>
      new @AlertsService().addAlert 'Коефіцієнт успішно змінено', 'success'