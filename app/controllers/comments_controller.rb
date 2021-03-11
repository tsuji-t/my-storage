class CommentsController < ApplicationController

  def create
   @comment = Comment.new
   @comment.save(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(message).merge(user_id: currend_user.id, word_id: params[:word_id])
end
