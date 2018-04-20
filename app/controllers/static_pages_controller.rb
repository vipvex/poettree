class StaticPagesController < ApplicationController
  def home
  end
  
  def about_us
  end
  
  def dashboard
    @lesson_groups = LessonGroup.includes(:lessons)
  end
  
  def tos
  
  end
  
  def privacy
    
  end
end
