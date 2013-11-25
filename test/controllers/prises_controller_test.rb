require 'test_helper'

class PrisesControllerTest < ActionController::TestCase
  setup do
    @prise = prises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prise" do
    assert_difference('Prise.count') do
      post :create, prise: { month: @prise.month, status: @prise.status, title: @prise.title }
    end

    assert_redirected_to prise_path(assigns(:prise))
  end

  test "should show prise" do
    get :show, id: @prise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prise
    assert_response :success
  end

  test "should update prise" do
    patch :update, id: @prise, prise: { month: @prise.month, status: @prise.status, title: @prise.title }
    assert_redirected_to prise_path(assigns(:prise))
  end

  test "should destroy prise" do
    assert_difference('Prise.count', -1) do
      delete :destroy, id: @prise
    end

    assert_redirected_to prises_path
  end
end
