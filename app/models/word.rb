class Word < ApplicationRecord
  
  with_options presence: true do
    validates :title
    validates :text
  end

  belongs_to :user

  def self.search(search)
    if search != ""
      Word.where('title LIKE(?) or tug LIKE(?) or text LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Word.all
    end
  end

end
