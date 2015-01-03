app.factory 'PriceFactor' ,['$resource', '$http', 'BaseObject', ($resource, $http, BaseObject)->
  class PriceFactor extends BaseObject
    constructor: ->
      super '/api/variables/:id'
    findByName: (name)->
      $resource('/api/variables/findByName').get {name: name}, (->null), @errorHandler
]