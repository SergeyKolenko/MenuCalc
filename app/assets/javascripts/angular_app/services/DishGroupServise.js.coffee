app.factory 'DishGroup',['$resource', 'Group', ($resource, Group) ->
  class DishGroup extends Group
    constructor: ->
      super '/api/dish_groups/:id'
  new DishGroup()
]