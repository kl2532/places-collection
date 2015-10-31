require 'test_helper'

class PublicListsControllerTest < ActionController::TestCase
  setup do
    @public_list = public_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_list" do
    assert_difference('PublicList.count') do
      post :create, public_list: { description: @public_list.description, name: @public_list.name }
    end

    assert_redirected_to public_list_path(assigns(:public_list))
  end

  test "should show public_list" do
    get :show, id: @public_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_list
    assert_response :success
  end

  test "should update public_list" do
    patch :update, id: @public_list, public_list: { description: @public_list.description, name: @public_list.name }
    assert_redirected_to public_list_path(assigns(:public_list))
  end

  test "should destroy public_list" do
    assert_difference('PublicList.count', -1) do
      delete :destroy, id: @public_list
    end

    assert_redirected_to public_lists_path
  end
end
