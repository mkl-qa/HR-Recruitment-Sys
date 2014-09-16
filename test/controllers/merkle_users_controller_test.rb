require 'test_helper'

class MerkleUsersControllerTest < ActionController::TestCase
  setup do
    @merkle_user = merkle_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merkle_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merkle_user" do
    assert_difference('MerkleUser.count') do
      post :create, merkle_user: { bu: @merkle_user.bu, chn_name: @merkle_user.chn_name, email: @merkle_user.email, eng_name: @merkle_user.eng_name, location: @merkle_user.location, mgr: @merkle_user.mgr, position_title: @merkle_user.position_title, user_name: @merkle_user.user_name, user_psd: @merkle_user.user_psd, user_role: @merkle_user.user_role }
    end

    assert_redirected_to merkle_user_path(assigns(:merkle_user))
  end

  test "should show merkle_user" do
    get :show, id: @merkle_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merkle_user
    assert_response :success
  end

  test "should update merkle_user" do
    patch :update, id: @merkle_user, merkle_user: { bu: @merkle_user.bu, chn_name: @merkle_user.chn_name, email: @merkle_user.email, eng_name: @merkle_user.eng_name, location: @merkle_user.location, mgr: @merkle_user.mgr, position_title: @merkle_user.position_title, user_name: @merkle_user.user_name, user_psd: @merkle_user.user_psd, user_role: @merkle_user.user_role }
    assert_redirected_to merkle_user_path(assigns(:merkle_user))
  end

  test "should destroy merkle_user" do
    assert_difference('MerkleUser.count', -1) do
      delete :destroy, id: @merkle_user
    end

    assert_redirected_to merkle_users_path
  end
end
