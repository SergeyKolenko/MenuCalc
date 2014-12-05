app.factory 'BaseObject', [ '$resource','$http', 'AlertsService', ($resource, $http, AlertsService)->
  class BaseObject
    constructor: ()->
    errorHandler: (data)->
      new AlertsService().addAlert data.status + " " + data.statusText, 'danger'

]