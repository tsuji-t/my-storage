require 'rails_helper'

# 実行コマンド
# bundle exec rspec spec/models/user_spec.rb

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    it '全て存在すれば正常に登録できる' do
      expect(@user).to be_valid
    end

    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
    end

    it 'メールアドレスが空では登録できない'do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'メールアドレスは@を含まないと登録出来ない' do
      @user.email = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'メールアドレスが同じだと登録で出来ない'do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'パスワードが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'パスワードは、6文字以上でないと登録出来ない' do
      @user.password = "aaa11"
      @user.password_confirmation = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'パスワード（確認）が空だと、登録出来ない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      
    end
    it 'パスワードとパスワード（確認）が、一致がしないと登録できない' do
      @user.password = "aaa111"
      @user.password_confirmation = "bbb222"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

  end
end








  