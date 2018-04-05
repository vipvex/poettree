class AddLessonGroupReferencesToLesson < ActiveRecord::Migration[5.1]
  def change
    add_reference :lessons, :lesson_group, foreign_key: true
  end
end
