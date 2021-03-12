require 'rails_helper'

# 実行コマンド
# bundle exec rspec spec/models/word_spec.rb

RSpec.describe Word, type: :model do
  before do
    @word = FactoryBot.build(:word)
  end

  describe '新規投稿' do

    context '新規登録ができる' do

      it '全て存在すれば正常に登録できる' do
        expect(@word).to be_valid
      end

      it 'サブタイトルが空でも登録できる' do
        @word.tug =  ""
        expect(@word).to be_valid
      end
    end


    context '新規投稿ができない' do

      it "タイトルが空だと投稿できない" do
        @word.title = ""
        @word.valid?
        expect(@word.errors.full_messages).to include("タイトルを入力してください")
      end

      it '投稿記事が空だと投稿できない'do
        @word.text = ""
        @word.valid?
        expect(@word.errors.full_messages).to include("投稿記事を入力してください")
      end

      it 'ユーザーが空だと投稿できない'do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include("ユーザー名を入力してください")
      end

    end
  end
  
end
