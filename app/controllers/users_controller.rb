class UsersController < ApplicationController
  before_action :side_ber

  def show
    @user = User.find(params[:id])
    @words = @user.words.order('created_at DESC')
    @comments = @user.comments.order('created_at DESC')
    @favorites = Favorite.where(user_id: @user.id).group(:word_id).order('count(user_id) desc')
  end

  private

  def side_ber
    @side_words = Word.includes(:user).order('created_at DESC')
  end

end
