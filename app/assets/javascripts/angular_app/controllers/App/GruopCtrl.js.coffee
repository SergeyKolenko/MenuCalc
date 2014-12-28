class  @GroupCtrl extends BaseCtrl
  @register app

  @inject '$scope', '$window', '$modal', 'AlertsService'

  initialize: (groupClass)->
    @alerts = new @AlertsService()
    @group = groupClass
    @$scope.groups = groupClass.all()
    @$scope.predicate = 'name'
  delete: (_group) ->
    index = @$scope.groups.indexOf _group
    if @$window.confirm("Ви дiйсно xочете видалити групу #{_group.name}?")
      @group.delete(_group.id).then =>
        @$scope.groups.splice index, 1
  create: ->
    if @$scope.new_group
      @group.create({name: @$scope.new_group}).then (data)=>
        @$scope.groups.push data
        @$scope.new_group = ""
        @$scope.groupForm.$setPristine()

  edit:(_group)->
    modalInstance = @$modal.open {
      templateUrl: 'modalEditGroup.html'
      controller: EditGroupCtrl
      size: 'sm'
      resolve: {
        group: ()->
          $.extend({}, _group)
      }
    }
    modalInstance.result.then (group)=>
      index = @$scope.groups.indexOf _group
      @group.update(group).then (data)=>
        @$scope.groups[index].name = data.name