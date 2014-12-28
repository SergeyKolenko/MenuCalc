app.factory 'Food', ['$resource','$http', 'BaseObject', ($resource,$http , BaseObject)->
  class Food extends BaseObject
    constructor: ->
      super '/api/foods/:id'
    getByGroup: (groupId) ->
      $resource('/api/foods/group/:group_id', {group_id: groupId}).query (->null), @errorHandler
]