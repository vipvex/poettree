class Lesson < ApplicationRecord
  belongs_to :lesson_group
  
  enum lesson_types: [ :video, :assignment ]
end
