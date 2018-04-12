class User < ActiveRecord::Base
  devise :rememberable, :trackable, :omniauthable,
         :omniauth_providers => [:facebook, :google_oauth2,
                                 *(:developer if Rails.env.development?)]

  has_many :poems
  has_many :lesson_completeds

  def name
    "#{self.first_name} #{self.last_name}" || 'Name not set'
  end

  def next_lesson
    return LessonGroup.all.order(:order).first.lessons.first if last_lesson.nil?
    
    lesson = Lesson.find_by(lesson_group_id: last_lesson_group.id, order: last_lesson.order + 1)
    
    if lesson.nil? && next_lesson_group.nil? == false
      lesson = next_lesson_group.lessons.first
    end
  
    return '#' if lesson.nil?  
    
    return lesson
  end
  
  def next_lesson_with_group
    return '#' if next_lesson == '#'
    nl = next_lesson
    return [nl.lesson_group, nl]
  end

  def last_lesson
    lesson_completeds.last.try(:lesson)
  end
  
  def last_lesson_group
    lesson_completeds.last.lesson.lesson_group
  end
  
  def next_lesson_group
    LessonGroup.find_by(order: last_lesson_group.order + 1)
  end

  def self.from_omniauth(auth)
    puts "\n#{auth}\n"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      # Might break stuff
      user.first_name = auth.info.try(:name)
    end
  end
  
end