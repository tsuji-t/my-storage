class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :side_ber

  def create
   @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to word_path(@comment.word)
    else
      @word = Word.find(params[:word_id])
      @favorite = Favorite.new
      @comments = @word.comments.includes(:user)
      @favorites = Favorite.where(word_id: @word.id)
      render "words/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, word_id: params[:word_id])
  end

  def side_ber
    @side_words = Word.includes(:user).order('created_at DESC')
  end
  
end
