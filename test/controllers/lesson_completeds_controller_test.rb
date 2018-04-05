require 'test_helper'

class LessonCompletedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_completed = lesson_completeds(:one)
  end

  test "should get index" do
    get lesson_completeds_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_completed_url
    assert_response :success
  end

  test "should create lesson_completed" do
    assert_difference('LessonCompleted.count') do
      post lesson_completeds_url, params: { lesson_completed: { lesson_id: @lesson_completed.lesson_id, user_id: @lesson_completed.user_id } }
    end

    assert_redirected_to lesson_completed_url(LessonCompleted.last)
  end

  test "should show lesson_completed" do
    get lesson_completed_url(@lesson_completed)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_completed_url(@lesson_completed)
    assert_response :success
  end

  test "should update lesson_completed" do
    patch lesson_completed_url(@lesson_completed), params: { lesson_completed: { lesson_id: @lesson_completed.lesson_id, user_id: @lesson_completed.user_id } }
    assert_redirected_to lesson_completed_url(@lesson_completed)
  end

  test "should destroy lesson_completed" do
    assert_difference('LessonCompleted.count', -1) do
      delete lesson_completed_url(@lesson_completed)
    end

    assert_redirected_to lesson_completeds_url
  end
end
