class WordsTag

  include ActiveModel::Model
  attr_accessor :title, :text, :tug, :name, :user_id

  with_options presence: true do
    validates :title
    validates :text
    validates :name
  end

  def save
    word = Word.create(title: title, text: text, tug: tug, user_id: user_id)
    tag = Tag.create(name: name)

    WordTag.create(word_id: word.id, tag_id: tag.id)
  end

end