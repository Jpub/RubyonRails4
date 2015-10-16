require 'test_helper'

class FanCommentsControllerTest < ActionController::TestCase
  setup do
    @fan_comment = fan_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fan_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fan_comment" do
    assert_difference('FanComment.count') do
      post :create, fan_comment: { author_no: @fan_comment.author_no, body: @fan_comment.body, deleted: @fan_comment.deleted, name: @fan_comment.name }
    end

    assert_redirected_to fan_comment_path(assigns(:fan_comment))
  end

  test "should show fan_comment" do
    get :show, id: @fan_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fan_comment
    assert_response :success
  end

  test "should update fan_comment" do
    patch :update, id: @fan_comment, fan_comment: { author_no: @fan_comment.author_no, body: @fan_comment.body, deleted: @fan_comment.deleted, name: @fan_comment.name }
    assert_redirected_to fan_comment_path(assigns(:fan_comment))
  end

  test "should destroy fan_comment" do
    assert_difference('FanComment.count', -1) do
      delete :destroy, id: @fan_comment
    end

    assert_redirected_to fan_comments_path
  end
end
