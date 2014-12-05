app.factory 'ModalDialog', [ '$window',($window) ->
  class ModalDialog
    constructor: () ->
    confirm: (message) ->
      $window.confirm message
]