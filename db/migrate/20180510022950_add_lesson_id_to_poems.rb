class AddLessonIdToPoems < ActiveRecord::Migration[5.1]
  def change
    add_reference :poems, :lesson, foreign_key: true
  end
end
