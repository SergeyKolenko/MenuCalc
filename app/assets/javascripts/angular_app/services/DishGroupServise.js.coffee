app.factory 'DishGroup',['$resource', 'Group', ($resource, Group) ->
  class DishGroup extends Group
    constructor: ->
      super '/api/dish_groups/:id'
    find: (groupId) ->
      $resource('/api/dish_groups/:id', {id: groupId}).get (->null), @errorHandler
  new DishGroup()
]