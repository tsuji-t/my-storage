class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :side_ber

  def create
   @favorite = Favorite.new(favotite_params)
    if @favotite.save
      redirect_to word_path(@favorite.word)
    else
      @word = Word.find(params[:word_id])
      @comments = @word.comments.includes(:user)
      render "words/show"
    end
  end

  private

  def favorite_params
    params.require(:favorite).merge(user_id: current_user.id, word_id: params[:word_id])
  end

  def side_ber
    @side_words = Word.includes(:user).order('created_at DESC')
  end
  
end
