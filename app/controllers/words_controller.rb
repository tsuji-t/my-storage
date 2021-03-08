class WordsController < ApplicationController

  def index
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new
    if @word.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
end
