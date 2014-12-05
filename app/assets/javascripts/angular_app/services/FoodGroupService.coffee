app.factory 'FoodGroup',['$resource', 'Group', ($resource, Group) ->
  class FoodGroup extends Group
    constructor: ->
      super '/api/food_groups/:id'
  new FoodGroup()
]