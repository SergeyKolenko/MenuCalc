app.factory 'Dish', ['$resource', '$http', 'BaseObject', ($resource, $http, BaseObject)->
  class Dish extends BaseObject
    constructor:->
      super
      @service = $resource '/api/dishes/:id', {id: '@id'}, {update: {method: 'PATCH'}}
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'
    all: ->
      @service.query (-> null), @errorHandler
    create: (attrs) ->
      new @service(attrs).$save (-> null), @errorHandler
    update: (attrs) ->
      new @service(attrs).$update {id: attrs.id},( -> null ), @errorHandler
    delete: (dishId) ->
      new @service().$delete  {id: dishId }, (-> null), @errorHandler
    find: (dishId) ->
     new @service().$get {id: dishId}, (->null), @errorHandler
    getByGroup: (groupId) ->
      $resource('/api/dishes/group/:group_id', {group_id: groupId}).query (->null), @errorHandler
]