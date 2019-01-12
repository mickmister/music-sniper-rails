class CommentsController < ApplicationController
  def create
    @comment = Comment.create!(comment_params)
    render 'show'
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment_params)
    render 'show'
  end

  def index
    if params[:audio_file_id]
      @comments = Comment.where(audio_file_id: params[:audio_file_id])
    else
      @comments = Comment.all
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy!
    render json: {}
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :audio_file_id)
  end
end
