class User < ActiveRecord::Base
  devise :rememberable, :trackable, :omniauthable,
         :omniauth_providers => [:facebook, :google_oauth2,
                                 *(:developer if Rails.env.development?)]

  has_many :poems
  has_many :lesson_completeds

  def next_lesson
    '#'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end
  
end