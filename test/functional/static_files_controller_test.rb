require 'test_helper'

class StaticFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_file" do
    assert_difference('StaticFile.count') do
      post :create, :static_file => { }
    end

    assert_redirected_to static_file_path(assigns(:static_file))
  end

  test "should show static_file" do
    get :show, :id => static_files(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => static_files(:one).to_param
    assert_response :success
  end

  test "should update static_file" do
    put :update, :id => static_files(:one).to_param, :static_file => { }
    assert_redirected_to static_file_path(assigns(:static_file))
  end

  test "should destroy static_file" do
    assert_difference('StaticFile.count', -1) do
      delete :destroy, :id => static_files(:one).to_param
    end

    assert_redirected_to static_files_path
  end
end
