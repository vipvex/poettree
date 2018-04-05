class LessonCompleted < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  
  scope :in_lesson_group, -> (lesson_group) { joins(:lesson).where('lessons.lesson_group_id = ?', lesson_group.id) }
  
end
