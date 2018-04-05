require 'test_helper'

class LessonGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lesson_group = lesson_groups(:one)
  end

  test "should get index" do
    get lesson_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_lesson_group_url
    assert_response :success
  end

  test "should create lesson_group" do
    assert_difference('LessonGroup.count') do
      post lesson_groups_url, params: { lesson_group: { order: @lesson_group.order, title: @lesson_group.title } }
    end

    assert_redirected_to lesson_group_url(LessonGroup.last)
  end

  test "should show lesson_group" do
    get lesson_group_url(@lesson_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_lesson_group_url(@lesson_group)
    assert_response :success
  end

  test "should update lesson_group" do
    patch lesson_group_url(@lesson_group), params: { lesson_group: { order: @lesson_group.order, title: @lesson_group.title } }
    assert_redirected_to lesson_group_url(@lesson_group)
  end

  test "should destroy lesson_group" do
    assert_difference('LessonGroup.count', -1) do
      delete lesson_group_url(@lesson_group)
    end

    assert_redirected_to lesson_groups_url
  end
end
