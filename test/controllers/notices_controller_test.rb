require 'test_helper'

class NoticesControllerTest < ActionController::TestCase
  setup do
    @notice = notices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notice" do
    assert_difference('Notice.count') do
      post :create, notice: { area: @notice.area, comment: @notice.comment, compensation: @notice.compensation, contact_address: @notice.contact_address, contact_email: @notice.contact_email, contact_name: @notice.contact_name, contact_phone: @notice.contact_phone, content: @notice.content, educated: @notice.educated, experience: @notice.experience, holiday: @notice.holiday, job_type: @notice.job_type, notice_type: @notice.notice_type, shift: @notice.shift, status: @notice.status, title: @notice.title }
    end

    assert_redirected_to notice_path(assigns(:notice))
  end

  test "should show notice" do
    get :show, id: @notice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notice
    assert_response :success
  end

  test "should update notice" do
    patch :update, id: @notice, notice: { area: @notice.area, comment: @notice.comment, compensation: @notice.compensation, contact_address: @notice.contact_address, contact_email: @notice.contact_email, contact_name: @notice.contact_name, contact_phone: @notice.contact_phone, content: @notice.content, educated: @notice.educated, experience: @notice.experience, holiday: @notice.holiday, job_type: @notice.job_type, notice_type: @notice.notice_type, shift: @notice.shift, status: @notice.status, title: @notice.title }
    assert_redirected_to notice_path(assigns(:notice))
  end

  test "should destroy notice" do
    assert_difference('Notice.count', -1) do
      delete :destroy, id: @notice
    end

    assert_redirected_to notices_path
  end
end
