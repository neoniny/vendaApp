require 'test_helper'

class FrequenciesControllerTest < ActionController::TestCase
  setup do
    @frequency = frequencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequency" do
    assert_difference('Frequency.count') do
      post :create, frequency: { api_ref: @frequency.api_ref, tier1: @frequency.tier1, tier2: @frequency.tier2, tier3: @frequency.tier3 }
    end

    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should show frequency" do
    get :show, id: @frequency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frequency
    assert_response :success
  end

  test "should update frequency" do
    patch :update, id: @frequency, frequency: { api_ref: @frequency.api_ref, tier1: @frequency.tier1, tier2: @frequency.tier2, tier3: @frequency.tier3 }
    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should destroy frequency" do
    assert_difference('Frequency.count', -1) do
      delete :destroy, id: @frequency
    end

    assert_redirected_to frequencies_path
  end
end
