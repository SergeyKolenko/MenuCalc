app.factory 'Food', ['$resource','$http', 'BaseObject', ($resource,$http , BaseObject)->
  class Food extends BaseObject
    constructor: ->
      super
      @service = $resource '/api/foods/:id', {id: '@id'}, {update: {method: 'PATCH'}}
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'
    all: ->
      @service.query (-> null), @errorHandler
    create: (attrs) ->
      new @service(attrs).$save (-> null), @errorHandler
    update: (attrs) ->
      new @service(attrs).$update {id: attrs.id},( -> null ), @errorHandler
    delete: (foodId) ->
      new @service().$delete  {id: foodId }, (-> null), @errorHandler
    find: (foodId) ->
      @service.get {id: foodId}, (->null), @errorHandler
    getByGroup: (groupId) ->
      $resource('/api/foods/group/:group_id', {group_id: groupId}).query (->null), @errorHandler
]