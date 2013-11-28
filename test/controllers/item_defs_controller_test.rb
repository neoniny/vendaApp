require 'test_helper'

class ItemDefsControllerTest < ActionController::TestCase
  setup do
    @item_def = item_defs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_defs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_def" do
    assert_difference('ItemDef.count') do
      post :create, item_def: { api_version: @item_def.api_version, batch: @item_def.batch, encryption: @item_def.encryption, job_frequency: @item_def.job_frequency, notification: @item_def.notification, request_type: @item_def.request_type, requirement_id: @item_def.requirement_id, transport_type: @item_def.transport_type }
    end

    assert_redirected_to item_def_path(assigns(:item_def))
  end

  test "should show item_def" do
    get :show, id: @item_def
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_def
    assert_response :success
  end

  test "should update item_def" do
    patch :update, id: @item_def, item_def: { api_version: @item_def.api_version, batch: @item_def.batch, encryption: @item_def.encryption, job_frequency: @item_def.job_frequency, notification: @item_def.notification, request_type: @item_def.request_type, requirement_id: @item_def.requirement_id, transport_type: @item_def.transport_type }
    assert_redirected_to item_def_path(assigns(:item_def))
  end

  test "should destroy item_def" do
    assert_difference('ItemDef.count', -1) do
      delete :destroy, id: @item_def
    end

    assert_redirected_to item_defs_path
  end
end
