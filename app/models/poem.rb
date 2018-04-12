class Poem < ApplicationRecord
  belongs_to :user

  paginates_per 5
  
  def self.search(search)
    if search
      where('title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end

end
