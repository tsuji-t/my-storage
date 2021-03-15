class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
   @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to word_path(@comment.word)
    else
      @word = Word.find(params[:id])
      @comments = @word.comments.includes(:user)
      render "words/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, word_id: params[:word_id])
  end
end
