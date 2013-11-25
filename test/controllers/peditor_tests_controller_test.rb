require 'test_helper'

class PeditorTestsControllerTest < ActionController::TestCase
  setup do
    @peditor_test = peditor_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peditor_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peditor_test" do
    assert_difference('PeditorTest.count') do
      post :create, peditor_test: {  }
    end

    assert_redirected_to peditor_test_path(assigns(:peditor_test))
  end

  test "should show peditor_test" do
    get :show, id: @peditor_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peditor_test
    assert_response :success
  end

  test "should update peditor_test" do
    patch :update, id: @peditor_test, peditor_test: {  }
    assert_redirected_to peditor_test_path(assigns(:peditor_test))
  end

  test "should destroy peditor_test" do
    assert_difference('PeditorTest.count', -1) do
      delete :destroy, id: @peditor_test
    end

    assert_redirected_to peditor_tests_path
  end
end
