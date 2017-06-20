require 'test_helper'

class SuggestionUserCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suggestion_user_comment = suggestion_user_comments(:one)
  end

  test "should get index" do
    get suggestion_user_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_suggestion_user_comment_url
    assert_response :success
  end

  test "should create suggestion_user_comment" do
    assert_difference('SuggestionUserComment.count') do
      post suggestion_user_comments_url, params: { suggestion_user_comment: { comment: @suggestion_user_comment.comment, suggestion_id: @suggestion_user_comment.suggestion_id, user_id: @suggestion_user_comment.user_id } }
    end

    assert_redirected_to suggestion_user_comment_url(SuggestionUserComment.last)
  end

  test "should show suggestion_user_comment" do
    get suggestion_user_comment_url(@suggestion_user_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_suggestion_user_comment_url(@suggestion_user_comment)
    assert_response :success
  end

  test "should update suggestion_user_comment" do
    patch suggestion_user_comment_url(@suggestion_user_comment), params: { suggestion_user_comment: { comment: @suggestion_user_comment.comment, suggestion_id: @suggestion_user_comment.suggestion_id, user_id: @suggestion_user_comment.user_id } }
    assert_redirected_to suggestion_user_comment_url(@suggestion_user_comment)
  end

  test "should destroy suggestion_user_comment" do
    assert_difference('SuggestionUserComment.count', -1) do
      delete suggestion_user_comment_url(@suggestion_user_comment)
    end

    assert_redirected_to suggestion_user_comments_url
  end
end
