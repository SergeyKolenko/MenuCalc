app.factory 'Ingredient' ,['$resource', '$http', 'BaseObject', ($resource, $http, BaseObject)->
  class  Ingredient extends BaseObject
    constructor: ->
      super
      @service = $resource '/api/ingredients/:id', {id: '@id'}, {update: {method: 'PATCH'}}
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs)->
      new @service(attrs).$save (-> null), @errorHandler
    update: (attrs) ->
      new @service(attrs).$update {id: attrs.id},( -> null ), @errorHandler
    delete: (dishId) ->
      new @service().$delete  {id: dishId }, (-> null), @errorHandler
    findByDish: (dishId) ->
      new $resource('/api/ingredients/dish/:dish_id', {dish_id: dishId}).query (-> null), @errorHandler

]