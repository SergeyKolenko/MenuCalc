app.factory 'Ingredient' ,['$resource', '$http', 'BaseObject', ($resource, $http, BaseObject)->
  class  Ingredient extends BaseObject
    constructor: ->
      super '/api/ingredients/:id'
    findByDish: (dishId) ->
      result = $resource('/api/ingredients/byGroup')
      result.query {dish_id: dishId}, (-> null), @errorHandler

]