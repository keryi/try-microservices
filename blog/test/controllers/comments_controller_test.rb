require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
    @post = posts(:one)
  end

  test "should get new" do
    get :new, post_id: @post.id
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, post_id: @post.id, comment: { content: @comment.content}
    end

    assert_redirected_to @post
  end

  test "should get edit" do
    get :edit, post_id: @post.id, id: @comment
    assert_response :success
  end

  test "should update comment" do
    patch :update, id: @comment, post_id: @post.id, comment: { content: @comment.content }
    assert_redirected_to @post
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to @post
  end
end
