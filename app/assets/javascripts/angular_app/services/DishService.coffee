app.factory 'Dish', ['$resource', '$http', 'BaseObject', ($resource, $http, BaseObject)->
  class Dish extends BaseObject
    constructor:->
      super '/api/dishes/:id'
    getByGroup: (groupId) ->
      $resource('/api/dishes/group/:group_id', {group_id: groupId}).query (->null), @errorHandler
]