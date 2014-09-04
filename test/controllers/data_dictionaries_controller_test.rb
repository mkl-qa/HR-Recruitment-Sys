require 'test_helper'

class DataDictionariesControllerTest < ActionController::TestCase
  setup do
    @data_dictionary = data_dictionaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_dictionaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_dictionary" do
    assert_difference('DataDictionary.count') do
      post :create, data_dictionary: { del_flg: @data_dictionary.del_flg, description: @data_dictionary.description, name: @data_dictionary.name, parent_code: @data_dictionary.parent_code }
    end

    assert_redirected_to data_dictionary_path(assigns(:data_dictionary))
  end

  test "should show data_dictionary" do
    get :show, id: @data_dictionary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_dictionary
    assert_response :success
  end

  test "should update data_dictionary" do
    patch :update, id: @data_dictionary, data_dictionary: { del_flg: @data_dictionary.del_flg, description: @data_dictionary.description, name: @data_dictionary.name, parent_code: @data_dictionary.parent_code }
    assert_redirected_to data_dictionary_path(assigns(:data_dictionary))
  end

  test "should destroy data_dictionary" do
    assert_difference('DataDictionary.count', -1) do
      delete :destroy, id: @data_dictionary
    end

    assert_redirected_to data_dictionaries_path
  end
end
