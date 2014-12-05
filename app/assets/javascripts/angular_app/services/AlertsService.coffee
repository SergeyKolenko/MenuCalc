app.factory 'AlertsService', ['$rootScope', ($rootScope) ->
  class  AlertsService
    constructor: ->
      $rootScope.alerts = []
    addAlert: (message, type)->
      $rootScope.alerts.push {msg: message, type: type, close: ->
          $rootScope.alerts.splice $rootScope.alerts.indexOf(this), 1
        }
    closeAlertIndx: (index)->
      $rootScope.alerts.splice index, 1
    closeAlert: (alert)->
      @closeAlertIndx $rootScope.alerts.indexOf(alert)
#  new AlertsService()
#  AlertsService
]