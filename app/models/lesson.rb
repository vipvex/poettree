class Lesson < ApplicationRecord
  belongs_to :lesson_group
  has_many :lesson_completeds, :dependent => :delete
  has_many :poems, :dependent => :delete
  
  enum lesson_types: [ :video, :assignment ]
  
  def completed_by?(user)
    lesson_completeds.where(user_id: user.id).empty? == false
  end
  
  def video?
    lesson_type == 'video'
  end
  
  def assignment?
    lesson_type == 'assignment'
  end
end
