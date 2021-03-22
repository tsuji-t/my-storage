class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_word
  before_action :find_favorite


  def create
    favorite = Favorite.create(favorite_params)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, word_id: params[:word_id])
    favorite.destroy
  end

  private

  def favorite_params
    params.permit.merge(user_id: current_user.id, word_id: params[:word_id])
  end
  
  def find_word
    @word = Word.find(params[:word_id])
  end

  def find_favorite
    @favorites = Favorite.where(word_id: @word.id)
  end

end
