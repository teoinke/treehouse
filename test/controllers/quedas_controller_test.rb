require 'test_helper'

class QuedasControllerTest < ActionController::TestCase
  setup do
    @queda = quedas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quedas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create queda" do
    assert_difference('Queda.count') do
      post :create, queda: { amostra: @queda.amostra, classificacao: @queda.classificacao, imei: @queda.imei, timestamp_queda: @queda.timestamp_queda, timestamp_recebimento: @queda.timestamp_recebimento }
    end

    assert_redirected_to queda_path(assigns(:queda))
  end

  test "should show queda" do
    get :show, id: @queda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @queda
    assert_response :success
  end

  test "should update queda" do
    patch :update, id: @queda, queda: { amostra: @queda.amostra, classificacao: @queda.classificacao, imei: @queda.imei, timestamp_queda: @queda.timestamp_queda, timestamp_recebimento: @queda.timestamp_recebimento }
    assert_redirected_to queda_path(assigns(:queda))
  end

  test "should destroy queda" do
    assert_difference('Queda.count', -1) do
      delete :destroy, id: @queda
    end

    assert_redirected_to quedas_path
  end
end
