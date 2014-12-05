app.factory 'Group',['BaseObject','$resource','$http',(BaseObject, $resource, $http) ->
  class Group extends BaseObject
    constructor: (addres) ->
      super
      @service = $resource addres, {id: '@id'}, {
        update: {method: 'PATCH'}
        get: {method: 'GET', isArray: true}
      }
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'
    all: ->
      @service.query (-> null), @errorHandler
    create: (attrs) ->
      new @service(attrs).$save (-> null), @errorHandler
    update: (groupId, attrs) ->
      new @service(attrs).$update {id: groupId},( -> null ), @errorHandler
    delete: (groupId) ->
      new @service().$delete  {id: groupId }, (-> null), @errorHandler

]
