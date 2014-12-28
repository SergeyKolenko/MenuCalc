app.factory 'BaseObject', [ '$resource','$http', 'AlertsService', ($resource, $http, AlertsService)->
  class BaseObject
    constructor: (addres) ->
      @service = $resource addres, {id: '@id'}, {
        update: {method: 'PATCH'}
      }
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'
    errorHandler: (data)->
      new AlertsService().addAlert data.status + " " + data.statusText, 'danger'
    all: ->
      @service.query (-> null), @errorHandler
    create: (attrs) ->
      new @service(attrs).$save (-> null), @errorHandler
    update: (attrs) ->
      new @service(attrs).$update {id: attrs.id},( -> null ), @errorHandler
    delete: (id) ->
      new @service().$delete  {id: id }, (-> null), @errorHandler
    find: (id) ->
      @service.get {id: id}, (->null), @errorHandler

]