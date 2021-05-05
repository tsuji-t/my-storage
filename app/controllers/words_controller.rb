class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :side_ber
  before_action :find_word, only: [:show, :edit, :update, :destroy]
  before_action :access_check, only: [:edit, :update, :destroy]

  def index
    @word = Word.includes(:user).order('created_at DESC')
    @words = @word.first(5)
    @favorites = Favorite.group(:word_id).order('count(user_id) DESC').limit(3)
  end

  def new
    @word = WordsTag.new
  end

  def create
    binding.pry
    @word = WordsTag.new(word_tag_params)
    if @word.valid?
      @word.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @word.comments.includes(:user)
    @favorite = Favorite.new
    @favorites = Favorite.where(word_id: @word.id)
  end

  def edit
  end

  def update
    if @word.valid?
      @word.update(word_params)
      redirect_to action: :show
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

  def access_check
    unless @word.user_id == current_user.id
      redirect_to root_path
    end
  end 

  def word_params
    params.require(:word).permit(:title, :tug, :text).merge(user_id: current_user.id)
  end

  def word_tag_params
    params.require(:words_tag).permit(:title, :tug, :text, :name).merge(user_id: current_user.id)
  end
end
