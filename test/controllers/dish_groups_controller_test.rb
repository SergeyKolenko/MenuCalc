require 'test_helper'

class DishGroupsControllerTest < ActionController::TestCase
  setup do
    @dish_group = dish_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dish_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dish_group" do
    assert_difference('DishGroup.count') do
      post :create, dish_group: { name: @dish_group.name }
    end

    assert_redirected_to dish_group_path(assigns(:dish_group))
  end

  test "should show dish_group" do
    get :show, id: @dish_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dish_group
    assert_response :success
  end

  test "should update dish_group" do
    patch :update, id: @dish_group, dish_group: { name: @dish_group.name }
    assert_redirected_to dish_group_path(assigns(:dish_group))
  end

  test "should destroy dish_group" do
    assert_difference('DishGroup.count', -1) do
      delete :destroy, id: @dish_group
    end

    assert_redirected_to dish_groups_path
  end
end
