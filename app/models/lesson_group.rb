class LessonGroup < ApplicationRecord
  has_many :lessons
  
  before_save :get_google_photo_id
  
  def completed_lessons_by(user)
    user.lesson_completeds.where(lesson_id: lessons.pluck(:id))
  end
  
  def locked_for?(user)
    previous_group = LessonGroup.find_by(order: self.order - 1)
    
    return false if previous_group == nil
    
    return true if previous_group.completed_lessons_by(user).count < previous_group.lessons.count
  end
  
  def get_google_photo_id
    return if photo.split("/d/").length <= 1
    self.photo = self.photo.split("/d/")[1].split("/view")[0]
    puts "\n\nID IS #{photo}"
  end
  
end
