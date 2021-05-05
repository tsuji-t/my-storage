class WordsTag

  include ActiveModel::Model
  attr_accessor :title, :text, :tug, :name, :user_id

  with_options presence: true do
    validates :title
    validates :text
  end

  def save
    word = Tweet.create(title: title, text: text, tug: tug, user_id: current_user.id)
    tag = Tag.create(name: name)

    WordTag.create(word_id: word.id, tag_id: tag.id)
  end

end