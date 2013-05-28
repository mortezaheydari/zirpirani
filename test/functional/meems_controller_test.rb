require 'test_helper'

class MeemsControllerTest < ActionController::TestCase
  setup do
    @meem = meems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meem" do
    assert_difference('Meem.count') do
      post :create, meem: { description: @meem.description, image: @meem.image, title: @meem.title }
    end

    assert_redirected_to meem_path(assigns(:meem))
  end

  test "should show meem" do
    get :show, id: @meem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meem
    assert_response :success
  end

  test "should update meem" do
    put :update, id: @meem, meem: { description: @meem.description, image: @meem.image, title: @meem.title }
    assert_redirected_to meem_path(assigns(:meem))
  end

  test "should destroy meem" do
    assert_difference('Meem.count', -1) do
      delete :destroy, id: @meem
    end

    assert_redirected_to meems_path
  end
end
