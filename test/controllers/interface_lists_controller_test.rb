require 'test_helper'

class InterfaceListsControllerTest < ActionController::TestCase
  setup do
    @interface_list = interface_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interface_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interface_list" do
    assert_difference('InterfaceList.count') do
      post :create, interface_list: { definition: @interface_list.definition, interface_type: @interface_list.interface_type, name: @interface_list.name, ref: @interface_list.ref }
    end

    assert_redirected_to interface_list_path(assigns(:interface_list))
  end

  test "should show interface_list" do
    get :show, id: @interface_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interface_list
    assert_response :success
  end

  test "should update interface_list" do
    patch :update, id: @interface_list, interface_list: { definition: @interface_list.definition, interface_type: @interface_list.interface_type, name: @interface_list.name, ref: @interface_list.ref }
    assert_redirected_to interface_list_path(assigns(:interface_list))
  end

  test "should destroy interface_list" do
    assert_difference('InterfaceList.count', -1) do
      delete :destroy, id: @interface_list
    end

    assert_redirected_to interface_lists_path
  end
end
