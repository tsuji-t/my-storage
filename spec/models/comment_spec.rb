require 'rails_helper'

# 実行コマンド
# bundle exec rspec spec/models/comment_spec.rb

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    it 'コメント投稿ができる' do
      expect(@comment).to be_valid
    end

    it 'コメントが空だと投稿できない' do
      @comment.message = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("コメントを入力してください")
    end

    it 'ユーザーが空だと投稿できない'do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("ユーザー名を入力してください")
    end

    it '記事が空だと投稿できない'do
      @comment.word = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("記事を入力してください")
    end
  end
end
