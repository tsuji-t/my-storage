class WordsController < ApplicationController
  before_action :side_ber
  before_action :find_word, only: [:show, :edit, :update, :destroy]

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
    @comment = Comment.new
    @comments = @word.comments.includes(:user)
  end

  def edit
  end

  def update
    if @word.update(word_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to root_path
  end

  def search
    @words = Word.search(params[:keyword])
    @keyword = params[:keyword]
  end

  private

  def find_word
    @word = Word.find(params[:id])
  end

  def side_ber
    @side_words = Word.includes(:user).order('created_at DESC')
  end

  def word_params
    params.require(:word).permit(:title, :tug, :text).merge(user_id: current_user.id)
  end
end
