app.factory 'Group',['BaseObject','$resource','$http',(BaseObject, $resource, $http) ->
  class Group extends BaseObject
    constructor: (addres) ->
      super(addres)

]
