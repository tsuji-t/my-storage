class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :side_ber

  def create
    @favorite = Favorite.create(favorite_params)
    redirect_to word_path(@favorite.word)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, word_id: params[:word_id])
    favorite.destroy
    redirect_to word_path
  end

  private

  def favorite_params
    params.permit.merge(user_id: current_user.id, word_id: params[:word_id])
  end

  def side_ber
    @side_words = Word.includes(:user).order('created_at DESC')
  end
  
end
