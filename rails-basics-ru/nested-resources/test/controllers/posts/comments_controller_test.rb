require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one) # убедись, что есть fixture posts(:one)
    @comment = post_comments(:one) # и post_comments(:one)
  end

  test 'should create comment' do
    assert_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: { body: 'New comment' } }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should get edit' do
    get edit_post_comment_url(@post, @comment)
    assert_response :success
  end

  test 'should update comment' do
    patch post_comment_url(@post, @comment), params: { post_comment: { body: 'Updated comment' } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy comment' do
    assert_difference('PostComment.count', -1) do
      delete post_comment_url(@post, @comment)
    end

    assert_redirected_to post_url(@post)
  end
end
