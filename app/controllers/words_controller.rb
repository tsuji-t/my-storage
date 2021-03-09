class WordsController < ApplicationController
  before_action :side_ber

  def index
    @word = Word.includes(:user).order('created_at DESC')
    @words = @word.first(5)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @word = Word.find(params[:id])
  end

  private

  def side_ber
    @side_words = Word.includes(:user).order('created_at DESC')
  end

  def word_params
    params.require(:word).permit(:title, :tug, :text).merge(user_id: current_user.id)
  end
end
