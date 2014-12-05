class  @EditGroupCtrl extends BaseCtrl
  @register app

  @inject '$scope', '$modalInstance', 'group'

  initialize: ->
    @$scope.group = @group


  ok: ->
    @$modalInstance.close @$scope.group
  cancel:->
    @$modalInstance.dismiss 'cancel'