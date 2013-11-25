require 'test_helper'

class RecruitsControllerTest < ActionController::TestCase
  setup do
    @recruit = recruits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recruits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recruit" do
    assert_difference('Recruit.count') do
      post :create, recruit: { address: @recruit.address, birthday: @recruit.birthday, brief: @recruit.brief, checked: @recruit.checked, educated: @recruit.educated, email: @recruit.email, experience: @recruit.experience, name: @recruit.name, notice_id: @recruit.notice_id, phone: @recruit.phone, sex: @recruit.sex, status: @recruit.status }
    end

    assert_redirected_to recruit_path(assigns(:recruit))
  end

  test "should show recruit" do
    get :show, id: @recruit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recruit
    assert_response :success
  end

  test "should update recruit" do
    patch :update, id: @recruit, recruit: { address: @recruit.address, birthday: @recruit.birthday, brief: @recruit.brief, checked: @recruit.checked, educated: @recruit.educated, email: @recruit.email, experience: @recruit.experience, name: @recruit.name, notice_id: @recruit.notice_id, phone: @recruit.phone, sex: @recruit.sex, status: @recruit.status }
    assert_redirected_to recruit_path(assigns(:recruit))
  end

  test "should destroy recruit" do
    assert_difference('Recruit.count', -1) do
      delete :destroy, id: @recruit
    end

    assert_redirected_to recruits_path
  end
end
