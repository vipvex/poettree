class Poem < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  paginates_per 5
  
  def author
    user.email.split('@')[0]
  end
  
  def self.search(search)
    if search
      where('title LIKE ? OR body LIKE ? OR author_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end

end
