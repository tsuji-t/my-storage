require 'rails_helper'

# 実行コマンド
# bundle exec rspec spec/models/favorite_spec.rb

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'お気に入り登録' do
    it 'お気に入り登録ができる' do
      expect(@favorite).to be_valid
    end

    it 'ユーザーが空だとお気に入り登録できない'do
      @favorite.user = nil
      @favorite.valid?
      expect(@favorite.errors.full_messages).to include("ユーザー名を入力してください")
    end

    it '記事が空だとお気に入り登録できない'do
      @favorite.word = nil
      @favorite.valid?
      expect(@favorite.errors.full_messages).to include("記事を入力してください")
    end
  end
end