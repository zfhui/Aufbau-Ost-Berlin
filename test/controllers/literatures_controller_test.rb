require 'test_helper'

class LiteraturesControllerTest < ActionController::TestCase
  setup do
    @literature = literatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:literatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create literature" do
    assert_difference('Literature.count') do
      post :create, literature: { author: @literature.author, cover_file: @literature.cover_file, published_at: @literature.published_at, publisher: @literature.publisher, subtitle: @literature.subtitle, title: @literature.title, url: @literature.url, year: @literature.year }
    end

    assert_redirected_to literature_path(assigns(:literature))
  end

  test "should show literature" do
    get :show, id: @literature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @literature
    assert_response :success
  end

  test "should update literature" do
    patch :update, id: @literature, literature: { author: @literature.author, cover_file: @literature.cover_file, published_at: @literature.published_at, publisher: @literature.publisher, subtitle: @literature.subtitle, title: @literature.title, url: @literature.url, year: @literature.year }
    assert_redirected_to literature_path(assigns(:literature))
  end

  test "should destroy literature" do
    assert_difference('Literature.count', -1) do
      delete :destroy, id: @literature
    end

    assert_redirected_to literatures_path
  end
end
